import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerPage extends StatefulWidget {
  @override
  _GestureRecognizerPageState createState() => _GestureRecognizerPageState();
}

class _GestureRecognizerPageState extends State<GestureRecognizerPage> {
  TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _gestureRecognizer.dispose();
  }

  void showInSnackBar(String value){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(value,style: TextStyle(fontSize: 25),)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("GestureRecognizer"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Room is not",
                    style: TextStyle(fontSize: 25)
                  ),
                  TextSpan(
                    text: "built",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                      decorationColor: Colors.amber,
                      decorationStyle: TextDecorationStyle.solid
                    ),
                    recognizer: _gestureRecognizer..onTap = (){
                     showInSnackBar("build 建造"); 
                    }
                  ),
                  TextSpan(
                    text: " in one day",
                    style: TextStyle(
                      fontSize: 25
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}