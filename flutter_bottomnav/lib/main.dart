import 'package:flutter/material.dart';
import './index.dart';
import './page2.dart';
import './page3.dart';
import './page4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      title: "底部",
      home: MainPage(title: "firstPage")
    );
  }
}
class MainPage extends StatefulWidget {
  MainPage({Key key,this.title}):super(key: key);
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  int _initPage = 1;

  BottomNavigationBarItem _bottomNavItem({IconData icon, String pageName}){
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(pageName,style: TextStyle(color: Colors.red))
    );
  }

  Widget _buildButtonNavBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _bottomNavItem(icon: Icons.home,pageName: "首页"),
        _bottomNavItem(icon: Icons.hot_tub,pageName: "页面2"),
        _bottomNavItem(icon: Icons.home,pageName: "首页3"),
        _bottomNavItem(icon: Icons.home,pageName: "首页4"),
      ],
      currentIndex: _initPage,
      onTap: _selectPage,
    );
  }

  Widget _selectPage(int index){
    setState(() {
      _initPage = index;
    });
    switch(index){
      case 0:
        IndexPage();
        break;
      case 1:
        Page2();
        break;
      case 2:
        Page3();
        break;
      case 3:
        Page4();
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectPage(_initPage),
      bottomNavigationBar: _buildButtonNavBar(),
    );
  }
}