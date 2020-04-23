import 'package:flutter/material.dart';

class ContextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('context测试')),
      body: Container(
        child: Builder(builder: (context){
          Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}