import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60
            )
          )
        ),
        Container(
          height: 120,
          width: 120,
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment(2, 0),
            child: FlutterLogo(
              size: 60
            )
          )
        ),
        Container(
          height: 120,
          width: 120,
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment(0.2, 0.6),
            child: FlutterLogo(
              size: 60
            )
          )
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.red
          ),
          child: Center(
              child: Text('张三')
            )
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.red
          ),
          child: Center(
            child: Text('张三')
          )
        )
      ].map((e) => Padding(padding: EdgeInsets.only(top:16),child: e)).toList(),
    );
  }
}