import 'package:demo/common_provider.dart';
import 'package:demo/domains/user/user.dart';
import 'package:demo/features/auth/presentation/widgets/form.dart';
import 'package:demo/features/auth/type.dart';
import 'package:demo/features/category/presentation/category_screen.dart';
import 'package:demo/widgets/future_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});
  static const String path = "/auth";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);

    Future<User?> authenticatedUser = authNotifier.currentUser();

    return FutureBuilder(
      future: authenticatedUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const FutureOptionWidget(
            children: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const FutureOptionWidget(
            children: Text('An connection error occured'),
          );
        }

        if (snapshot.data == null) {
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

        return const CategoryScreen();
      },
    );
  }
}
