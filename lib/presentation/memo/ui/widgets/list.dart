import 'package:demo/domains/memo/memo.dart';
import 'package:demo/presentation/memo/controller/memo_controller.dart';
import 'package:demo/presentation/memo/ui/screens/memo_screen.dart';
import 'package:demo/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoList extends ConsumerWidget {
  const MemoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoList = ref.watch(memoProvider);

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
          trailing: IconButton(
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
        );
      },
    );
  }
}
