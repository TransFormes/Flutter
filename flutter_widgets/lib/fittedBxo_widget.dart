import 'package:flutter/material.dart';
class FittedBoxWidget extends StatelessWidget {
  final rows = Row(
    children: <Widget>[
      Container(
        color: Colors.blue,
        width: 130.0,
        height: 130.0,
        margin: EdgeInsets.only(bottom: 10.0),
        child: new FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.topLeft,
          child: new Container(
            color: Colors.yellow,
            child: new Text("FittedBox"),
          ),
        ),
      ),
      Text(
        "BoxFit.cover",
        style: new TextStyle(fontSize: 20.0),
      )
    ],
  );
  Widget row3 = Row(
    children: <Widget>[
      Container(
        color: Colors.blue,
        width: 130.0,
        height: 130.0,
        margin: EdgeInsets.only(bottom: 10.0),
        child: new FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.topLeft,
          child: new Container(
            color: Colors.yellow,
            child: new Text("FittedBox"),
          ),
        ),
      ),
      Text(
        "BoxFit.scaleDown",
        style: new TextStyle(fontSize: 20.0),
      )
    ],
  );
  Widget row4 = Row(
    children: <Widget>[
      Container(
        color: Colors.blue,
        width: 130.0,
        height: 130.0,
        margin: EdgeInsets.only(bottom: 10.0),
        child: new FittedBox(
          fit: BoxFit.fitHeight,
          alignment: Alignment.topLeft,
          child: new Container(
            color: Colors.yellow,
            child: new Text("FittedBox"),
          ),
        ),
      ),
      Text(
        "BoxFit.fitHeight",
        style: new TextStyle(fontSize: 20.0),
      )
    ],
  );
  Widget row5 = Row(
    children: <Widget>[
      Container(
        color: Colors.blue,
        width: 130.0,
        height: 130.0,
        margin: EdgeInsets.only(bottom: 10.0),
        child:  FittedBox(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topLeft,
          child:  Container(
            color: Colors.yellow,
            child:  Text("FittedBox"),
          ),
        ),
      ),
      Text(
        "BoxFit.fitWidth",
        style:  TextStyle(fontSize: 20.0),
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox"),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                color: Colors.yellow,
                width: 130,
                height: 130,
                margin: EdgeInsets.only(bottom:10),
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.topLeft,
                  child: Text("fittedBox"),
                ),
              ),
              Text("boxFied",style: TextStyle(fontSize: 20),)
            ],
          ),
          rows,
          row3,
          row4,
          rows
        ],
      ),
    );
  }
}