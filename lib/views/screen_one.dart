import 'package:flutter/material.dart';
import 'package:templete_project/core/presentation/router/view.dart';

class ScreenOne extends View {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Hi,Allam")),
    );
  }
}
