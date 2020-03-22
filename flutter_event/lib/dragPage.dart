import 'package:flutter/material.dart';

class DragPage extends StatefulWidget {
  @override
  _DragPageState createState() => _DragPageState();
}

class _DragPageState extends State<DragPage> {
  double _top = 0.0;
  double _left = 0.0;
  double _size = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖拽控件"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: FlutterLogo(
                size: _size,
              ),
              onPanUpdate: (e){
                print(e);
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
            )
          )
        ],
      ),
    );
  }
}