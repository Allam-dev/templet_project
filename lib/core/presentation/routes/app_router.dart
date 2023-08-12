import 'package:flutter/material.dart';


   Map<String, WidgetBuilder> _routes = {};

   String routeOf(Widget screen) {
    _routes[screen.toString()] = (context) => screen;
    return screen.toString();
  }

   Map<String, WidgetBuilder> get routes => _routes;

