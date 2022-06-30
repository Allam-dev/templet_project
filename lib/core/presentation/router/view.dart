import 'package:flutter/material.dart';

import 'app_router.dart';

abstract class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  String get route => AppRouter.addRoute(view: this);
}

abstract class ViewState<T extends View> extends State<T> {
  @override
  void dispose() {
    AppRouter.removeRoute(routeName: widget.toString());
    super.dispose();
  }
}
