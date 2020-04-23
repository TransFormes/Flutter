import 'package:flutter/material.dart';

class DecoratedBxoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('decoratedBxoPage'),),
      body: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange[700]]
              ),
              borderRadius: BorderRadius.circular(3),
              boxShadow: [BoxShadow(color:Colors.black54,offset: Offset(2, 2),blurRadius: 4)]
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
              child: Text('login',style: TextStyle(color:Colors.white),),
            )
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                image: DecorationImage(image: AssetImage('imgs/avatar.png'))
              )
            ),
          )
        ],
      ),
    );
  }
}