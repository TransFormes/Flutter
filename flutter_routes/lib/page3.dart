import 'package:flutter/material.dart';
class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page3")),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("跳转页面4"),
              onPressed: (){
                Navigator.of(context).pushNamedAndRemoveUntil(
                  "/pages5", ModalRoute.withName("/page2"));
              }
            ),
            RaisedButton(
              child: Text("回退到page2"),
              onPressed: (){
                Navigator.popUntil(context, ModalRoute.withName("/page2"));
              }
            )
          ],
        ),
      ),
    );
  }
}