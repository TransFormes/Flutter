import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
        leading: IconButton(
          icon: Icon(Icons.face), 
          onPressed: (){
            Navigator.pop(context);
          }
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: "长按", 
            onPressed: (){}
          ),
          IconButton(
            icon: Icon(Icons.playlist_add),
            tooltip: "长按", 
            onPressed: (){}
          ),
          IconButton(
            icon: Icon(Icons.playlist_add_check),
            tooltip: "长按", 
            onPressed: (){}
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          FlutterLogo(
            size: 100,
            colors: Colors.red,
          )
        ],
      ),
    );
  }
}