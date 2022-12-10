import 'package:flutter/material.dart';

enum AuthStatus {
  signup("signup"),
  verify("verify"),
  signin("signin");

  final String value;

  const AuthStatus(this.value);
}

typedef AuthFnType = Future<void> Function({
  required CredentialType credential,
});

class FormGroup {
  final FocusNode node;
  final TextEditingController controller;

  const FormGroup({
    required this.node,
    required this.controller,
  });
}

class CredentialType {
  final String email, password;

  const CredentialType({
    required this.email,
    required this.password,
  });
}
