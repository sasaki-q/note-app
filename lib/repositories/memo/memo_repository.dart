import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/domains/memo/memo.dart';

abstract class MemoRepository {
  Future<List<Memo>> getMemoList({required String categoryId});
  Future<void> writeMemo({required Memo memo});
  Future<void> editMemo({required Memo memo});
  Future<void> deleteMemo({required String memoId});
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
    await memoFirestore.doc(memo.id.toString()).set({
      "id": memo.id,
      "uid": memo.uid,
      "title": memo.title,
      "contents": memo.contents,
      "category_id": memo.categoryId,
    });
  }

  @override
  Future<void> editMemo({required Memo memo}) async {
    await memoFirestore.doc(memo.id).update({
      "title": memo.title,
      "contents": memo.contents,
    });
  }

  @override
  Future<void> deleteMemo({required String memoId}) async =>
      await memoFirestore.doc(memoId).delete();
}
