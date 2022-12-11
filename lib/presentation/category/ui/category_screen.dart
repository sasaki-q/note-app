import 'package:demo/common_provider.dart';
import 'package:demo/domains/category/category.dart';
import 'package:demo/presentation/auth/controller/auth_controller.dart';
import 'package:demo/presentation/category/provider.dart';
import 'package:demo/presentation/memo/ui/screens/memo_list_screen.dart';
import 'package:demo/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});
  static const path = "/category";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthNotifier notifier = ref.read(authProvider.notifier);
    AsyncValue<List<dynamic>> category = ref.watch(categoryFutureProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Category Screen"),
        actions: [
          Center(
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async => await notifier.signOut(context: context),
            ),
          ),
        ],
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
                    onPressed: () => MyRouter.pushWithArgument(
                      argument: RouterArgument(
                        context: context,
                        nextPage: MemoListScreen(category: currentCategory),
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
