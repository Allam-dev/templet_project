import 'package:flutter/material.dart';
import 'package:templete_project/core/presentation/routes/app_navigator.dart';
import 'package:templete_project/core/presentation/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRouter.routes,
      // initialRoute: const ScreenOne().route,
    );
  }
}