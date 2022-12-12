import 'package:demo/domains/memo/memo.dart';
import 'package:demo/repositories/memo/memo_repository.dart';
import 'package:flutter/material.dart';

abstract class MemoUsecase {
  Future<List<Memo>> getMemoList({required String categoryId});
  Future<Memo> writeMemo({required Memo memo});
  Future<Memo> editMemo({required Memo memo});
}

class MemoUsecaseImpl implements MemoUsecase {
  const MemoUsecaseImpl({required this.repository});
  final MemoRepository repository;

  @override
  Future<List<Memo>> getMemoList({required String categoryId}) async {
    try {
      return await repository.getMemoList(categoryId: categoryId);
    } catch (err) {
      debugPrint("DEBUG get memo list error message === $err");
      return [];
    }
  }

  @override
  Future<Memo> writeMemo({required Memo memo}) async {
    try {
      await repository.writeMemo(memo: memo);
      return memo;
    } catch (err) {
      debugPrint("DEBUG write memo error message === $err");
      return memo;
    }
  }

  @override
  Future<Memo> editMemo({required Memo memo}) async {
    try {
      await repository.editMemo(memo: memo);
      return memo;
    } catch (err) {
      debugPrint("DEBUG edit memo error message === $err");
      return memo;
    }
  }
}
