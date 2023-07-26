import 'package:flutter/material.dart';

abstract class AppRouter {
  static Map<String, WidgetBuilder> _routes = {};

  static String routeOf(Widget screen) {
    _routes[screen.toString()] = (context) => screen;
    return screen.toString();
  }

  static Map<String, WidgetBuilder> get routes => _routes;
}