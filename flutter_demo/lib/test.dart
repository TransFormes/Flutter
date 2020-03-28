import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  DateTime _lastTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("测试"),
      ),
    );
  }
}