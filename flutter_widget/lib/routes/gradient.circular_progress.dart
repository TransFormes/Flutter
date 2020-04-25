import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradientCirCularProgressPage extends StatefulWidget {
  @override
  _GradientCirCularProgressPageState createState() => _GradientCirCularProgressPageState();
}

class _GradientCirCularProgressPageState extends State<GradientCirCularProgressPage> with TickerProviderStateMixin{
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}