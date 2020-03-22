import 'package:flutter/material.dart';
class ContextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Context"),
      ),
      body: Column(
        children: <Widget>[
          Builder(builder: (context){
            Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
            return (scaffold.appBar as AppBar).title;
          })
        ],
      ),
    );
  }
}