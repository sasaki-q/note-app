import 'package:demo/domains/user/user.dart' as myuser;
import 'package:demo/presentation/auth/ui/screens/auth_screen.dart';
import 'package:demo/presentation/auth/type.dart';
import 'package:demo/common_provider.dart';
import 'package:demo/usecases/auth/auth_usecase.dart';
import 'package:demo/usecases/user/user_usecase.dart';
import 'package:demo/utils/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthStatus> {
  AuthNotifier({
    required this.ref,
    required this.authUsecase,
    required this.userUsecase,
  }) : super(AuthStatus.signin);

  final StateNotifierProviderRef<AuthNotifier, AuthStatus> ref;
  final AuthUsecase authUsecase;
  final UserUsecase userUsecase;

  UserCredential? signupCredentials;

  void switchMode() {
    state = state == AuthStatus.signin ? AuthStatus.signup : AuthStatus.signin;
  }

  Future<void> signup({required CredentialType credential}) async {
    signupCredentials = await authUsecase.signup(credential: credential);

    final authenticatedUser = signupCredentials?.user;
    if (authenticatedUser == null) return;

    final user = await userUsecase.create(
      user: myuser.User(
        id: authenticatedUser.uid,
        email: authenticatedUser.email!,
      ),
    );

    ref.read(userProvider.notifier).state = user;

    MyRouter.pushAndRemoveUntil(
      argument: RouterArgument(
        context: credential.context,
        nextPage: const AuthScreen(),
      ),
    );
  }

  Future<void> signin({required CredentialType credential}) async {
    final signinCredential = await authUsecase.signin(credential: credential);

    final authenticatedUser = signinCredential?.user;
    if (authenticatedUser == null) return;

    final user = await userUsecase.getUser(uid: authenticatedUser.uid);

    ref.read(userProvider.notifier).state = user;

    MyRouter.pushAndRemoveUntil(
      argument: RouterArgument(
        context: credential.context,
        nextPage: const AuthScreen(),
      ),
    );
  }

  Future<myuser.User?> currentUser() async {
    User? authenticatedUser = authUsecase.currentUser();

    if (authenticatedUser == null) return null;

    final user = await userUsecase.getUser(uid: authenticatedUser.uid);
    ref.read(userProvider.notifier).state = user;
    return user;
  }

  Future<void> signOut({required BuildContext context}) async {
    await authUsecase.signOut();
    MyRouter.pushAndRemoveUntil(
      argument: RouterArgument(
        context: context,
        nextPage: const AuthScreen(),
      ),
    );
  }
}
