import 'package:flutter/material.dart';

abstract class AppRouter {
  static String addRoute({required Widget view}) {
    _routes[view.toString()] = (context) => view;
    return view.toString();
  }

  static void removeRoute({required String routeName}) {
    _routes.remove(routeName);
  }

  static Map<String, WidgetBuilder> _routes = {};
  
  static Map<String, WidgetBuilder> get routes => _routes;
}
