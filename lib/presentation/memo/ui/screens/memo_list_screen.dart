import 'package:demo/common_provider.dart';
import 'package:demo/domains/category/category.dart';
import 'package:demo/domains/memo/memo.dart';
import 'package:demo/presentation/auth/controller/auth_controller.dart';
import 'package:demo/presentation/memo/controller/memo_controller.dart';
import 'package:demo/presentation/memo/ui/screens/memo_screen.dart';
import 'package:demo/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoListScreen extends ConsumerWidget {
  const MemoListScreen({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthNotifier notifier = ref.watch(authProvider.notifier);
    final MemoController controller = ref.watch(memoProvider.notifier);
    Future<List<Memo>> memoList =
        controller.getMemoList(categoryId: category.id);

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
          future: memoList,
          builder: (context, snapshot) {
            List<Memo>? memoList = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return const Text('An connection error occured');
            }

            if (memoList == null || memoList.isEmpty) {
              return const Text(
                "This category is empty \n Let's post memo on this category",
              );
            }

            return ListView.builder(
              itemCount: memoList.length,
              itemBuilder: (context, index) {
                final Memo currentMemo = memoList[index];

                return ListTile(
                  title: Text(currentMemo.title),
                  subtitle: Text(
                    currentMemo.contents.length > 10
                        ? currentMemo.contents.substring(0, 9)
                        : currentMemo.contents,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {},
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => MyRouter.pushWithArgument(
          argument: RouterArgument(
            context: context,
            nextPage: const MemoScreen(memo: null),
          ),
        ),
      ),
    );
  }
}
