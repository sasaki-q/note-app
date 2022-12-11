import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/presentation/auth/controller/auth_controller.dart';
import 'package:demo/presentation/auth/type.dart';
import 'package:demo/repositories/auth/auth_repository.dart';
import 'package:demo/repositories/category/category_repository.dart';
import 'package:demo/repositories/memo/memo_repository.dart';
import 'package:demo/repositories/user/user_repository.dart';
import 'package:demo/usecases/auth/auth_usecase.dart';
import 'package:demo/usecases/category/category_usecase.dart';
import 'package:demo/usecases/memo/memo_usecase.dart';
import 'package:demo/usecases/user/user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/domains/user/user.dart' as myuser;

final memoryProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final userProvider = StateProvider<myuser.User?>((ref) => null);

class FirebaseInstanceClass {
  final FirebaseAuth authInstance;
  final CollectionReference<Map<String, dynamic>> userFirestore;
  final CollectionReference<Map<String, dynamic>> categoryFirestore;
  final CollectionReference<Map<String, dynamic>> memoFirestore;

  const FirebaseInstanceClass({
    required this.authInstance,
    required this.userFirestore,
    required this.categoryFirestore,
    required this.memoFirestore,
  });
}

final firebaseProvider = Provider<FirebaseInstanceClass>(
  (ref) {
    final FirebaseFirestore store = FirebaseFirestore.instance;

    return FirebaseInstanceClass(
      authInstance: FirebaseAuth.instance,
      userFirestore: store.collection("user"),
      categoryFirestore: store.collection("category"),
      memoFirestore: store.collection("memo"),
    );
  },
);

final authProvider = StateNotifierProvider<AuthNotifier, AuthStatus>(
  (ref) => AuthNotifier(
    ref: ref,
    authUsecase: ref.watch(authUsecaseProvider),
    userUsecase: ref.watch(userUsecaseProvider),
  ),
);

// usecase provider
final authUsecaseProvider = Provider<AuthUsecase>(
  (ref) => AuthUsecaseImpl(repository: ref.watch(authRepositoryProvider)),
);

final userUsecaseProvider = Provider<UserUsecase>(
  (ref) => UserUsecaseImpl(repository: ref.watch(userRepositoryProvider)),
);

final categoryUsecaseProvider = Provider<CategoryUsecase>(
  (ref) => CategoryUsecaseImpl(
    repository: ref.watch(categoryRepositoryProvider),
  ),
);

final memoUsecaseProvider = Provider<MemoUsecase>(
  (ref) => MemoUsecaseImpl(
    repository: ref.watch(memoRepositoryProvider),
  ),
);

// repository provider
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    authInstance: ref.watch(firebaseProvider).authInstance,
  ),
);

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(
    userFirestore: ref.watch(firebaseProvider).userFirestore,
  ),
);

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => CategoryRepositoryImpl(
    categoryFirestore: ref.watch(firebaseProvider).categoryFirestore,
  ),
);

final memoRepositoryProvider = Provider<MemoRepository>(
  (ref) => MemoRepositoryImpl(
    memoFirestore: ref.watch(firebaseProvider).memoFirestore,
  ),
);
