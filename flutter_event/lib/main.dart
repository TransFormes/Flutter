import 'package:flutter/material.dart';
import './index.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter事件处理',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {},
      home: IndexPage(),
    );
  }
}