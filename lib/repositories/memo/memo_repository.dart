import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/domains/memo/memo.dart';

abstract class MemoRepository {
  Future<List<Memo>> getMemoList({required String categoryId});
  Future<void> writeMemo({required Memo memoForm});
}

class MemoRepositoryImpl implements MemoRepository {
  const MemoRepositoryImpl({required this.memoFirestore});
  final CollectionReference<Map<String, dynamic>> memoFirestore;

  @override
  Future<List<Memo>> getMemoList({required String categoryId}) async {
    return [];
  }

  @override
  Future<void> writeMemo({required Memo memoForm}) async {}
}
