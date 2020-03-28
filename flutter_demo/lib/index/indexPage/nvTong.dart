import 'package:flutter/material.dart';
class NvTong extends StatefulWidget {
  @override
  _NvTongState createState() => _NvTongState();
}

class _NvTongState extends State<NvTong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("女童",style: TextStyle(color:Colors.white),),
      ),
    );
  }
}