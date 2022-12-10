import 'package:demo/common_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryFutureProvider = FutureProvider((ref) async {
  final usecase = ref.watch(categoryUsecaseProvider);

  return usecase.getCategory();
});
