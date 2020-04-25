import 'package:flutter/material.dart';
import './compontents/navigationService.dart';
import './pages/videoViewController.dart';
import './pages/like_view_controller.dart';
import './pages/layoutViewController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '标题',
      navigatorKey: navigationService.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
        ListTile(
          title: Text("like pop demo"),
          onTap: () {
            navigationService.cNavigaTo(LikeViewController());
          },
        ),
        ListTile(
          title: Text("layout view demo"),
          onTap: () {
            navigationService.cNavigaTo(LayoutViewController());
          },
        ),
        ListTile(
          title: Text("video view demo"),
          onTap: () {
            navigationService.cNavigaTo(VideoViewController());
          },
        ),
      ]).toList()),
    );
  }
}