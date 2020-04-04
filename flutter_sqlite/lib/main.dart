import 'package:flutter/material.dart';
import './pages/login.dart';
void main() => runApp(MyApp());

final routes = {
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '注册登录',
      theme: new ThemeData(primarySwatch: Colors.brown),
      routes: routes,
    );
  }
}