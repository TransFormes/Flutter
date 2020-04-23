import 'package:flutter/material.dart';

class ButtomPage extends StatefulWidget {
  @override
  _ButtomPageState createState() => _ButtomPageState();
}

class _ButtomPageState extends State<ButtomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('buttom')),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: null,
            child: Text('RaisedButton')
          ),
          OutlineButton(
            onPressed: null,
            child: Text('OutlineButton'),
          ),
          IconButton(
            icon: Icon(Icons.thumb_down), 
            onPressed: null
          ),
          FlatButton(
            onPressed: null, 
            child: Text('FlatButton'),
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          RaisedButton.icon(
            onPressed: null, 
            icon: Icon(Icons.send), 
            label: Text('发送')
          ),
          OutlineButton.icon(
            onPressed: null, 
            icon: Icon(Icons.add), 
            label: Text('添加')
          ),
          FlatButton.icon(
            onPressed: null, 
            icon: Icon(Icons.info), 
            label: Text('详情')
          )
        ],
      ),
    );
  }
}