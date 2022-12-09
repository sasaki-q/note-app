import 'package:demo/domains/user/user.dart';
import 'package:demo/repositories/user/user_repository.dart';
import 'package:flutter/material.dart';

abstract class UserUsecase {
  Future<User?> create({required User user});
  Future<User?> getUser({required String uid});
}

class UserUsecaseImpl implements UserUsecase {
  UserUsecaseImpl({required this.repository});
  final UserRepository repository;

  @override
  Future<User?> create({required User user}) async {
    try {
      await repository.create(user: user);
      return user;
    } catch (err) {
      debugPrint("DEBUG create user error message === $err");
      return null;
    }
  }

  @override
  Future<User?> getUser({required String uid}) async {
    try {
      return await repository.getUser(uid: uid);
    } catch (err) {
      debugPrint("DEBUG create user error message === $err");
      return null;
    }
  }
}
