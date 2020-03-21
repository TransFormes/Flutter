import 'package:flutter/material.dart';
import './index.dart';
import './login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routers = <String, WidgetBuilder>{
    LoginPage.tag:(context) => LoginPage(),
    IndexPage.tag:(context) => IndexPage()
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "登录界面",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: LoginPage(),
      routes: routers,
    );
  }
}