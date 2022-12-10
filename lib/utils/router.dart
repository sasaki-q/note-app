import 'package:flutter/material.dart';

class RouterArgument<T> {
  final BuildContext context;
  final T nextPage;

  const RouterArgument({
    required this.context,
    required this.nextPage,
  });
}

class MyRouter {
  static void pushWithArgument({
    required RouterArgument argument,
  }) =>
      Navigator.push(
        argument.context,
        MaterialPageRoute(builder: (BuildContext context) => argument.nextPage),
      );

  static void pushAndRemoveUntil({required RouterArgument argument}) =>
      Navigator.pushAndRemoveUntil(
        argument.context,
        MaterialPageRoute(builder: (context) => argument.nextPage),
        (_) => false,
      );
}
