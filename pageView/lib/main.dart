import 'package:flutter/material.dart';
import './four.dart';
import './index.dart';
import './second.dart';
import './three.dart';

void mian() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页'),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          print(index);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('第二个页面')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('第三个页面')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('第四个页面')
          ),
        ]
      ),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          Index(),
          Second(),
          Three(),
          Four()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}