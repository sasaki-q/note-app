import 'package:demo/domains/memo/memo.dart';
import 'package:demo/repositories/memo/memo_repository.dart';

abstract class MemoUsecase {
  Future<List<Memo>> getMemoList({required String categoryId});
  Future<void> writeMemo({required Memo memoForm});
}

class MemoUsecaseImpl implements MemoUsecase {
  const MemoUsecaseImpl({required this.repository});
  final MemoRepository repository;

  @override
  Future<List<Memo>> getMemoList({required String categoryId}) async {
    return [];
  }

  @override
  Future<void> writeMemo({required Memo memoForm}) async {}
}
