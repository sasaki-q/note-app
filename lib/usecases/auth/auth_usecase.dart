import 'package:demo/features/auth/type.dart';
import 'package:demo/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthUsecase {
  User? currentUser();
  Future<UserCredential?> signup({required CredentialType credential});
  Future<UserCredential?> signin({required CredentialType credential});
}

class AuthUsecaseImpl implements AuthUsecase {
  const AuthUsecaseImpl({required this.repository});
  final AuthRepository repository;

  @override
  User? currentUser() => repository.currentUser();

  @override
  Future<UserCredential?> signup({required CredentialType credential}) async {
    try {
      return await repository.signup(credential: credential);
    } catch (err) {
      debugPrint("DEBUG signup error message === $err");
      return null;
    }
  }

  @override
  Future<UserCredential?> signin({required CredentialType credential}) async {
    try {
      return await repository.signin(credential: credential);
    } catch (err) {
      debugPrint("DEBUG signin error message === $err");
      return null;
    }
  }
}
