import 'package:flutter/material.dart';
class NanZhuang extends StatefulWidget {
  @override
  _NanZhuangState createState() => _NanZhuangState();
}

class _NanZhuangState extends State<NanZhuang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("男装",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}