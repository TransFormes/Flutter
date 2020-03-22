import 'package:flutter/material.dart';
class ConstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBox"),
      ),
      // 里面的子元素最大大小就是maxWidth,maxHeight
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 100,
          minWidth: 100,
          maxHeight: 250,
          maxWidth: 250
        ),
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue,
          child: Text("文字"),
        ),
      ),
    );
  }
}