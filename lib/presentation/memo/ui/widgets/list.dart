import 'package:demo/domains/memo/memo.dart';
import 'package:demo/presentation/memo/controller/memo_controller.dart';
import 'package:demo/presentation/memo/type.dart';
import 'package:demo/presentation/memo/ui/screens/memo_screen.dart';
import 'package:demo/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoList extends ConsumerWidget {
  const MemoList({super.key, required this.deleteFuntion});
  final WriteMemoFunctionType deleteFuntion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoList = ref.watch(memoProvider);

    if (memoList.isEmpty) {
      return const Text(
        "This category's memo is empty. \n Let's post memo on this category.",
      );
    }

    return ListView.builder(
      itemCount: memoList.length,
      itemBuilder: (context, index) {
        Memo currentMemo = memoList[index];

        return ListTile(
          title: Text(currentMemo.title),
          subtitle: Text(
            currentMemo.contents.length > 20
                ? "${currentMemo.contents.substring(0, 19)}..."
                : currentMemo.contents,
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () => MyRouter.pushWithArgument(
                    argument: RouterArgument(
                      context: context,
                      nextPage: MemoScreen(
                        memo: currentMemo,
                        categoryId: currentMemo.categoryId,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline_outlined),
                  onPressed: () async => await deleteFuntion(
                    context: context,
                    memo: currentMemo,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
