import 'package:flutter/material.dart';

class BaselineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baseline"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Baseline(
            baseline: 100, 
            baselineType: TextBaseline.alphabetic,
            child: Text("今天周日",style: TextStyle(fontSize:18,textBaseline: TextBaseline.alphabetic)),
          ),
          Baseline(
            baseline: 100, 
            baselineType: TextBaseline.alphabetic,
            child: Text("适合",style: TextStyle(fontSize:30,textBaseline: TextBaseline.alphabetic)),
          ),
          Baseline(
            baseline: 100, 
            baselineType: TextBaseline.alphabetic,
            child: FlutterLogo(
              size: 100,
            ),
          )
        ],
      ),
    );
  }
}