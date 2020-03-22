import 'package:flutter/material.dart';
class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: GridView.count(
        primary: false,
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        // 一行放几个元素
        crossAxisCount: 4,
        children: <Widget>[
          Text("A"),
          Text("B"),
          Text("C"),
          Text("D"),
          Text("E"),
          Text("F"),
        ],
      ),
    );
  }
}