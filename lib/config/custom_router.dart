import 'package:flutter/cupertino.dart';
import 'package:routemaster/routemaster.dart';

class CustomRouter {
  void push(BuildContext context, String path) {
    Routemaster.of(context).push(path);
  }

  void pop(BuildContext context) {
    Routemaster.of(context).pop();
  }
}
