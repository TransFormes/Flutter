import 'package:flutter/material.dart';
class IndexPage extends StatelessWidget {
  static String tag = "首页";
  @override
  Widget build(BuildContext context) {
    final user = Hero(
      tag: "hero", 
      child: Padding(
        padding: EdgeInsets.all(20),
        child: CircleAvatar(
          radius: 72,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("assets/bg.jpeg"),
        ),
      )
    );
    final welcome = Padding(
      padding: EdgeInsets.all(8),
      child: Text("欢迎",style: TextStyle(color:Colors.white,fontSize: 20),),
    );
    final info = Padding(
      padding: EdgeInsets.all(8),
      child: Text("我是信息",style: TextStyle(color:Colors.white,fontSize:20),),
    );
    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        // 渐变色
        gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.lightBlueAccent
          ]
        ),
      ),
      child: Column(
        children: <Widget>[
          user,
          welcome,
          info
        ],
      ),
    );
    return Scaffold(
      body: body,
    );
  }
}