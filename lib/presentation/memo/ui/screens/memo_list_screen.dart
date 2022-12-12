import 'package:demo/common_provider.dart';
import 'package:demo/domains/category/category.dart';
import 'package:demo/domains/memo/memo.dart';
import 'package:demo/presentation/auth/controller/auth_controller.dart';
import 'package:demo/presentation/memo/controller/memo_controller.dart';
import 'package:demo/presentation/memo/ui/screens/memo_screen.dart';
import 'package:demo/presentation/memo/ui/widgets/list.dart';
import 'package:demo/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitMemoListScreen extends ConsumerWidget {
  const InitMemoListScreen({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthNotifier notifier = ref.watch(authProvider.notifier);
    Future<List<Memo>> asyncMemoList =
        ref.watch(memoProvider.notifier).getMemoList(categoryId: category.id);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${category.category}'s memo list"),
        actions: [
          Center(
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async => await notifier.signOut(context: context),
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: asyncMemoList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return const Text('An connection error occured');
            }

            if (snapshot.data == null) {
              return const Text("Something went wrong, can't get data");
            }

            return snapshot.connectionState == ConnectionState.done
                ? MemoList(
                    deleteFuntion: ref.watch(memoProvider.notifier).deleteMemo,
                  )
                : const SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => MyRouter.pushWithArgument(
          argument: RouterArgument(
            context: context,
            nextPage: MemoScreen(memo: null, categoryId: category.id),
          ),
        ),
      ),
    );
  }
}
