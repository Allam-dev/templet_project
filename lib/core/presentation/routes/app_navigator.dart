import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NamedNavigator {
  static final NamedNavigator _namedNavigator = NamedNavigator._internal();

  factory NamedNavigator() {
    return _namedNavigator;
  }

  NamedNavigator._internal();

  void push({required String routeName}) {
    navigatorKey.currentState!.pushNamed(routeName);
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }

  void pushReplacement({required String routeName}) {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  void pushAndRemoveUntil(
      {required String routeName, required RoutePredicate predicate}) {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, predicate);
  }
}
