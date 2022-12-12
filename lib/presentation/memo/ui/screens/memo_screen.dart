import 'package:demo/common_provider.dart';
import 'package:demo/domains/memo/memo.dart';
import 'package:demo/domains/user/user.dart';
import 'package:demo/presentation/memo/controller/memo_controller.dart';
import 'package:demo/presentation/memo/type.dart';
import 'package:demo/presentation/memo/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoScreen extends ConsumerWidget {
  const MemoScreen({super.key, required this.memo, required this.categoryId});
  final Memo? memo;
  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? user = ref.read(userProvider);
    MemoController controller = ref.read(memoProvider.notifier);
    WriteMemoFunctionType function =
        memo == null ? controller.writeMemo : controller.editMemo;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          memo == null ? "Let's create memo" : "Edit: ${memo?.title}",
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: MemoForm(
          props: MemoFormWidgetProps(
            user: user!,
            categoryId: categoryId,
            function: function,
            memo: memo,
          ),
        ),
      ),
    );
  }
}
