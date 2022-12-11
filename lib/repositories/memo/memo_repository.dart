import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/domains/memo/memo.dart';

abstract class MemoRepository {
  Future<List<Memo>> getMemoList({required String categoryId});
  Future<void> writeMemo({required Memo memo});
}

class MemoRepositoryImpl implements MemoRepository {
  const MemoRepositoryImpl({required this.memoFirestore});
  final CollectionReference<Map<String, dynamic>> memoFirestore;

  @override
  Future<List<Memo>> getMemoList({required String categoryId}) async {
    return await memoFirestore
        .where("category_id", isEqualTo: categoryId)
        .get()
        .then(
          (value) =>
              value.docs.map<Memo>((e) => Memo.fromJson(e.data())).toList(),
        );
  }

  @override
  Future<void> writeMemo({required Memo memo}) async {
    await memoFirestore.add({
      "id": memo.id,
      "uid": memo.uid,
      "title": memo.title,
      "contents": memo.contents,
      "category_id": memo.categoryId,
    });
  }
}
