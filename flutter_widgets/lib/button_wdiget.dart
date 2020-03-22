import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("按钮")),
      body: Column(
        children: <Widget>[
          RaisedButton(
            elevation: 10,
            color: Colors.blue,
            child: Text("RaisedButton"),
            textColor: Colors.white,
            onPressed: null
          ),
          FlatButton(
            onPressed: null, 
            child: Text("FlatButton"),
            textColor: Colors.blue,
          ),
          OutlineButton(
            onPressed: null,
            textColor: Colors.blue,
            child: Text("OutlineButton"),
          ),
          FloatingActionButton(
            onPressed: null,
            child: Text("圆角"),
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.red, 
            onPressed: null
          ),
          RaisedButton.icon(
            onPressed: null, 
            icon: Icon(Icons.face), 
            label: Text('face')
          ),
          FlatButton(
            onPressed: null, 
            child: Text("Rounded Button"),
            textTheme: ButtonTextTheme.accent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(
                color: Colors.red
              )
            ),
          ),
          FlatButton(
            onPressed: null, 
            child: Text("Beveled Button"),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color:Colors.red)
            ),
          )
        ],
      ),
    );
  }
}