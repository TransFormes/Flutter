import 'package:flutter/material.dart';
import './index.dart';
import './curved_animations.dart';
import './animatedbuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      title: "动画",
      routes: {
        '/curved': (context) => CuredAnimations(),
        '/AnimatedBuilder': (context) => AnimatedBuilderPage(),
      },
      home: MainPage(),
    );
  }
}