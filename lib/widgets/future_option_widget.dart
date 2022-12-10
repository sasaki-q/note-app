import 'package:flutter/material.dart';

class FutureOptionWidget extends StatelessWidget {
  const FutureOptionWidget({super.key, required this.children});
  final Widget children;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: children)),
    );
  }
}
