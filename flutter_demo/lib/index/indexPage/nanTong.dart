import 'package:flutter/material.dart';
class NanTong extends StatefulWidget {
  @override
  _NanTongState createState() => _NanTongState();
}

class _NanTongState extends State<NanTong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("男童",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}