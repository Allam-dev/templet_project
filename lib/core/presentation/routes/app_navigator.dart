import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class AppNavigator {
  static void push({required String routeName}) {
    navigatorKey.currentState!.pushNamed(routeName);
  }

  static void pop() {
    navigatorKey.currentState!.pop();
  }

  static void pushReplacement({required String routeName}) {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static void pushAndRemoveUntil(
      {required String routeName, required RoutePredicate predicate}) {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, predicate);
  }
}
