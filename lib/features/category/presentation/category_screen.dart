import 'package:demo/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});
  static const path = "/category";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    print("DEBUG category screen ==== $user");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Category Screen"),
      ),
    );
  }
}
