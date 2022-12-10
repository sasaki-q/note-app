import 'package:demo/domains/category/category.dart';
import 'package:demo/repositories/category/category_repository.dart';
import 'package:flutter/material.dart';

abstract class CategoryUsecase {
  Future<List<Category>> getCategory();
}

class CategoryUsecaseImpl implements CategoryUsecase {
  const CategoryUsecaseImpl({required this.repository});
  final CategoryRepository repository;

  @override
  Future<List<Category>> getCategory() async {
    try {
      return await repository.getCategory();
    } catch (err) {
      debugPrint("DEBUG get category error message === $err");
      return [];
    }
  }
}
