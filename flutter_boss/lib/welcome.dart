import 'dart:async';
import 'package:flutter/material.dart';
import './common/config/config.dart';
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
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder<Null>(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
            return AnimatedBuilder(
              animation: animation, 
              builder: (BuildContext context, Widget child){
                return Opacity(
                  opacity: animation.value,
                  child: MainPage(title: '选服'),
                );
              });
          },
          transitionDuration: Duration(milliseconds: 300)
        )
        , (route) => false);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Config.GLOBAL_COLOR,
      child: Container(
        alignment: Alignment.center,
        child: Text('选服',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
      ),
    );
  }
}