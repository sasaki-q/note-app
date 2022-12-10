import 'package:demo/presentation/auth/type.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  User? currentUser();
  Future<UserCredential> signup({required CredentialType credential});
  Future<UserCredential> signin({required CredentialType credential});
  Future<void> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authInstance});
  final FirebaseAuth authInstance;

  @override
  User? currentUser() => authInstance.currentUser;

  @override
  Future<UserCredential> signup({required CredentialType credential}) async {
    return await authInstance.createUserWithEmailAndPassword(
      email: credential.email,
      password: credential.password,
    );
  }

  @override
  Future<UserCredential> signin({required CredentialType credential}) async {
    return await authInstance.signInWithEmailAndPassword(
      email: credential.email,
      password: credential.password,
    );
  }

  @override
  Future<void> signOut() async => await authInstance.signOut();
}
