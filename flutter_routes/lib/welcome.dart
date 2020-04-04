import 'dart:async';

import 'package:flutter/material.dart';
import './page1.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Timer _timer;
  @override
  void initState() { 
    super.initState();
    _timer = Timer(Duration(seconds: 3), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
        return Page1();
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
    return Scaffold(
      body: Container(
        width: 750,
        child: Image.network("https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1859321827,3986512466&fm=26&gp=0.jpg",fit: BoxFit.fill,),
      ),
    );
  }
}