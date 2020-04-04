import 'package:flutter/material.dart';
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("启动页")),
      body: Center(
        child: FlatButton(
          onPressed: (){
            Navigator.pushNamed(context, "/welcome");
          }, 
          child: Text("启动页面")
        ),
      ),
    );
  }
}