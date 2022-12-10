import 'package:demo/domains/category/category.dart';
import 'package:demo/features/category/provider.dart';
import 'package:demo/features/memo/presentation/screens/memo_screen.dart';
import 'package:demo/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});
  static const path = "/category";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<dynamic>> category = ref.watch(categoryFutureProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Category Screen"),
      ),
      body: Center(
        child: category.when(
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Fetch Error: $err'),
          data: (categories) {
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: ((context, i) {
                Category currentCategory = categories[i];
                return ListTile(
                  key: Key(currentCategory.id),
                  title: Text(currentCategory.category),
                  subtitle: Text(currentCategory.id),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: () => MyRouter.pushPageWithArgument(
                      argument: PushPageWithArgumentClass(
                        context: context,
                        nextPage: MemoScreen(selectedCategory: currentCategory),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
