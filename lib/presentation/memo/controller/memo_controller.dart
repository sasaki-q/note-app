import 'package:demo/common_provider.dart';
import 'package:demo/domains/memo/memo.dart';
import 'package:demo/usecases/memo/memo_usecase.dart';
import 'package:demo/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memoProvider =
    StateNotifierProvider.autoDispose<MemoController, List<Memo>>(
  (ref) => MemoController(memoUsecase: ref.watch(memoUsecaseProvider)),
);

class MemoController extends StateNotifier<List<Memo>> {
  MemoController({required this.memoUsecase}) : super([]);
  final MemoUsecase memoUsecase;

  Future<List<Memo>> getMemoList({required String categoryId}) async {
    List<Memo> memoList = await memoUsecase.getMemoList(categoryId: categoryId);
    state = memoList;
    return memoList;
  }

  Future<void> writeMemo({
    required BuildContext context,
    required Memo memo,
  }) async {
    Memo createdMemo = await memoUsecase.writeMemo(memo: memo);
    MyRouter.pop(context: context);

    state = state.isEmpty ? List.of([createdMemo]) : [createdMemo, ...state];
  }

  Future<void> editMemo({
    required BuildContext context,
    required Memo memo,
  }) async {
    await memoUsecase.editMemo(memo: memo);
    MyRouter.pop(context: context);

    int index = state.indexWhere((e) => e.id == memo.id);
    List<Memo> copiedState = List.of(state);
    copiedState[index] = memo;

    state = copiedState;
  }

  Future<void> deleteMemo({
    required BuildContext context,
    required Memo memo,
  }) async {
    await memoUsecase.deleteMemo(memoId: memo.id);

    List<Memo> copiedState = List.of(state);
    copiedState.remove(memo);

    state = copiedState;
  }
}
