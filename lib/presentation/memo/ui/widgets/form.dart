import 'package:demo/presentation/auth/type.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';

class MemoForm extends StatefulWidget {
  const MemoForm({super.key});
  @override
  MemoFormState createState() => MemoFormState();
}

class MemoFormState extends State<MemoForm> {
  final _formKey = GlobalKey<FormState>();
  final emailFormGroup = FormGroup(
    node: FocusNode(),
    controller: TextEditingController(),
  );

  final passwordFormGroup = FormGroup(
    node: FocusNode(),
    controller: TextEditingController(),
  );

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    return emailRegExp.hasMatch(value) ? null : "Invalid email address";
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    return RegExp("[A-Z]").hasMatch(value)
        ? null
        : "Please include uppercase capital";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: emailFormGroup.node,
                controller: emailFormGroup.controller,
                validator: (value) => validateEmail(value),
                decoration: const InputDecoration(hintText: "test@example.com"),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                focusNode: passwordFormGroup.node,
                controller: passwordFormGroup.controller,
                validator: (value) => validatePassword(value),
                decoration: const InputDecoration(hintText: "***********"),
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
