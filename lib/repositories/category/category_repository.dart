import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/domains/category/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategory();
}

class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl({required this.categoryFirestore});
  final CollectionReference<Map<String, dynamic>> categoryFirestore;

  @override
  Future<List<Category>> getCategory() async {
    return await categoryFirestore.get().then(
          (value) => value.docs
              .map<Category>((e) => Category.fromJson(e.data()))
              .toList(),
        );
  }
}
