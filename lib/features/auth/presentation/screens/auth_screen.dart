import 'package:demo/features/auth/controller/auth_controller.dart';
import 'package:demo/features/auth/presentation/widgets/form.dart';
import 'package:demo/features/auth/type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});
  static const String path = "/auth";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Auth Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AuthForm(
            authStatus: authStatus,
            function: authStatus == AuthStatus.signin
                ? authNotifier.signin
                : authNotifier.signup,
            switchFunction: authNotifier.switchMode,
          )
        ],
      ),
    );
  }
}
