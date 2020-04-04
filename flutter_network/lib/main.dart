import 'package:flutter/material.dart';
import './index.dart';
import './httpClientTest.dart';
import './httpDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "网络编程",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: {
        'HttpClient': (context) => HttpClientTest(),
        'HttpDeom': (context) => HttpDemo()
      },
      home: MainPage(),
    );
  }
}