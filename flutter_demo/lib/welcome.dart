import 'dart:async';
import 'package:flutter/material.dart';
import './main.dart';

class WelCome extends StatefulWidget {
  @override
  _WelComeState createState() => _WelComeState();
}

class _WelComeState extends State<WelCome> {
  Timer _timer;

  @override
  void initState() { 
    super.initState();
    _timer = Timer(Duration(seconds: 3), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
        return HomePage();
      }), (route) => false);
    });
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Image.network('https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2952482128,2699669274&fm=26&gp=0.jpg',fit: BoxFit.cover,width: width,height: height,)
    );
  }
}