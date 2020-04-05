import 'package:flutter/material.dart';
import './errorPage.dart';
import './page1.dart';
import './page2.dart';
import './page3.dart';
import './splash.dart';
import './welcome.dart';
import './page5.dart';
import './navigator_with_result.dart';
import './todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final List<String, dynamic> list = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "路由",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: {
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
        '/page5': (context) => Page5(),
        '/splash': (context) => Splash(),
        '/welcome': (context) => Welcome(),
      },
      onUnknownRoute: (RouteSettings settings){
        String name = settings.name;
        print("未匹配到路由：${name}");
        return MaterialPageRoute(builder: (BuildContext context){
          return ErrorPage();
        });
      },
      home: TodoScreen(),
    );
  }
}