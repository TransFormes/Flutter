import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("http demo")),
      body: Center(
        child: FlatButton(
          child: Text("发送"),
          onPressed: (){

          },
        ),
      ),
    );
  }
}