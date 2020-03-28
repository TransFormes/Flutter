import 'package:flutter/material.dart';
import './../provider/index.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text("${Store().nums}")
    );
  }
}