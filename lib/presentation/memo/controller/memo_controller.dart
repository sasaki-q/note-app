import 'package:demo/common_provider.dart';
import 'package:demo/domains/memo/memo.dart';
import 'package:demo/usecases/memo/memo_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memoProvider =
    StateNotifierProvider.autoDispose<MemoController, List<Memo>>(
  (ref) => MemoController(
    memoUsecase: ref.watch(memoUsecaseProvider),
  ),
);

class MemoController extends StateNotifier<List<Memo>> {
  MemoController({required this.memoUsecase}) : super([]);
  final MemoUsecase memoUsecase;

  Future<List<Memo>> getMemoList({required String categoryId}) async {
    final memoList = await memoUsecase.getMemoList(categoryId: categoryId);
    state = memoList;
    await Future.delayed(const Duration(seconds: 3));
    return memoList;
  }
}
