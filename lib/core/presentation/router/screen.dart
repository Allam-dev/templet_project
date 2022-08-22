import 'package:flutter/material.dart';

import 'app_router.dart';

abstract class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  String get route => AppRouter.addRoute(screen: this);
}

abstract class ScreenState<T extends Screen> extends State<T> {
  @override
  void dispose() {
    AppRouter.removeRoute(routeName: widget.toString());
    super.dispose();
  }
}
