import 'package:flutter/material.dart';

class AnimatedSwitcherCounerPage extends StatefulWidget {
  @override
  _AnimatedSwitcherCounerPageState createState() => _AnimatedSwitcherCounerPageState();
}

class _AnimatedSwitcherCounerPageState extends State<AnimatedSwitcherCounerPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('animtedSwitherCounter')),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation){
                return ScaleTransition(scale: animation,child: child,);
              },
              child: Text(
                '$counter',
                key: ValueKey(counter),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            RaisedButton(
              child: Text('+1'),
              onPressed: (){
                setState(() {
                  counter+=1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}