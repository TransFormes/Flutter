import 'package:flutter/material.dart';
class Nvzhuang extends StatefulWidget {
  @override
  _NvzhuangState createState() => _NvzhuangState();
}

class _NvzhuangState extends State<Nvzhuang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("女装",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}