import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/domains/user/user.dart';

abstract class UserRepository {
  Future<void> create({required User user});
  Future<User> getUser({required String uid});
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.userFirestore});
  final CollectionReference<Map<String, dynamic>> userFirestore;

  @override
  Future<void> create({required User user}) async {
    await userFirestore.add({"id": user.id, "email": user.email});
  }

  @override
  Future<User> getUser({required String uid}) async {
    return await userFirestore
        .where("id", isEqualTo: uid)
        .get()
        .then((value) => User.fromJson(value.docs[0].data()));
  }
}
