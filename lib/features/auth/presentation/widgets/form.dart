import 'package:demo/features/auth/type.dart';
import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    super.key,
    required this.authStatus,
    required this.function,
    required this.switchFunction,
  });

  final AuthFnType function;
  final AuthStatus authStatus;
  final Function switchFunction;
  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<AuthForm> {
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }

                    await widget.function(
                      credential: CredentialType(
                        context: context,
                        email: emailFormGroup.controller.text,
                        password: passwordFormGroup.controller.text,
                      ),
                    );
                  },
                  child: Text(widget.authStatus.value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextButton(
                  child: Text(
                    widget.authStatus.value == "signup"
                        ? "login?"
                        : "create account?",
                  ),
                  onPressed: () => widget.switchFunction(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
