import 'package:flutter/material.dart';
class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("路由")),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/page3');
          },
          child: Text("页面3"),
        )
      ),
    );
  }
}