import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  factory CustomRouter(BuildContext context) {
    _inst.context = context;
    return _inst;
  }

  CustomRouter._internal();

  late BuildContext context;

  static final CustomRouter _inst = CustomRouter._internal();

  void goToMainPage() {
    context.router.replaceNamed('main');
  }
}
