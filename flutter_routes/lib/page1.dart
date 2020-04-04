import 'package:flutter/material.dart';
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("路由")),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/page2');
          },
          child: Text("页面2"),
        )
      ),
    );
  }
}