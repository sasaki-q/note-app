import 'package:flutter/material.dart';

class PushPageWithArgumentClass<T> {
  final BuildContext context;
  final T nextPage;

  const PushPageWithArgumentClass({
    required this.context,
    required this.nextPage,
  });
}

class MyRouter {
  static void pushPageWithArgument({
    required PushPageWithArgumentClass argument,
  }) =>
      Navigator.push(
        argument.context,
        MaterialPageRoute(builder: (BuildContext context) => argument.nextPage),
      );
}
