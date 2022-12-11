import 'package:demo/domains/memo/memo.dart';
import 'package:demo/domains/user/user.dart';
import 'package:flutter/material.dart';

typedef WriteMemoFunctionType = Future<void> Function({
  required BuildContext context,
  required Memo memo,
});

class MemoFormWidgetProps {
  final String categoryId;
  final User user;
  final WriteMemoFunctionType function;

  const MemoFormWidgetProps({
    required this.categoryId,
    required this.user,
    required this.function,
  });
}
