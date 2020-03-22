import 'package:flutter/material.dart';
class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.blue,
            child: Text("外边距"),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("内边距"),
            color: Colors.red,
          ),
          Center(
            child: Container(
              color: Colors.green,
              alignment: Alignment(0,0),
              child: Text("Container"),
              constraints: BoxConstraints(
                maxWidth: 300,
                maxHeight: 300,
                minWidth: 200,
                minHeight: 120
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Text("flutter"),
            constraints: BoxConstraints.expand(
              width: 250,
              height: 100
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:60,left:80),
            constraints: BoxConstraints.tightFor(width: 300,height: 150),
            decoration: BoxDecoration(
              border: Border.all(width: 3,color: Color(0xffaaaaaa)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2, 2),
                  blurRadius: 4
                )
              ],
              gradient: LinearGradient(
                colors: [
                  Colors.red, Colors.blue,Colors.yellow
                ]
              )
            ),
            transform: Matrix4.rotationZ(.3),
            alignment: Alignment.center,
            child: Text("佩奇"),
          )
        ],
      ),
    );
  }
}