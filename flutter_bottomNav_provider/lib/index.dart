import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我是首页")),
      body: Center(
        child: Column(
          // 副轴方向
          crossAxisAlignment: CrossAxisAlignment.center,
          // 主轴方向
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("我是首页内容")
          ],
        ),
      ),
    );
  }
}