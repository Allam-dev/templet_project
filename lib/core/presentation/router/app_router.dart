import 'package:flutter/material.dart';

abstract class AppRouter {
  static String addRoute({required Widget screen}) {
    _routes[screen.toString()] = (context) => screen;
    return screen.toString();
  }

  static void removeRoute({required String routeName}) {
    _routes.remove(routeName);
  }

  static Map<String, WidgetBuilder> _routes = {};
  
  static Map<String, WidgetBuilder> get routes => _routes;
}
