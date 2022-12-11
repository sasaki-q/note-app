import 'package:demo/domains/memo/memo.dart';
import 'package:demo/presentation/memo/controller/memo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoScreen extends ConsumerWidget {
  const MemoScreen({super.key, this.memo});
  final Memo? memo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MemoController controller = ref.read(memoProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          memo == null ? "Let's create memo" : "Edit: ${memo?.title}",
        ),
      ),
      body: const Align(
        alignment: Alignment.center,
        child: Text("this is memo screen"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: () {},
      ),
    );
  }
}
