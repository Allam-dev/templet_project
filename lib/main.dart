import 'package:flutter/material.dart';
import 'package:templete_project/core/presentation/router/app_router.dart';
// import 'package:templete_project/views/screen_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRouter.routes,
      // initialRoute: const ScreenOne().route,
    );
  }
}