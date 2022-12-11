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
  static void pop({required BuildContext context}) => Navigator.pop(context);

  static void popAndPush({required RouterArgument argument}) {
    Navigator.pop(argument.context);
    MyRouter.pushWithArgument(argument: argument);
  }

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
