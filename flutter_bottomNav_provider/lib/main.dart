import 'package:flutter/material.dart';
import './index.dart';
import './second.dart';
import './three.dart';
import './four.dart';
import './provider/model/bottomNavIndexModal.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 去除debug标志
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 主题颜色
        primarySwatch: Colors.blue 
      ),
      //
      title: "我是home键下面的标题",
      home: ChangeNotifierProvider<BottomNavBarProvider>(
        child: MainHome(title: "provider"),
        create: (_) => BottomNavBarProvider(),
      ),
      // home: MainHome(),
    );
  }
}
class MainHome extends StatefulWidget {
  MainHome({Key key, this.title}):super(key: key);
  final String title;
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var pageArr = [
    Index(),
    Second(),
    Three(),
    Four()
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      //导航
      // appBar: AppBar(title: Text("首页"),),
      body: pageArr[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("第二个页面")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text("第三个页面")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hot_tub),
            title: Text("第四个页面")
          ),
        ],
        onTap: (index){
          provider.currentIndex = index;
        },
      ),
    );
  }
}