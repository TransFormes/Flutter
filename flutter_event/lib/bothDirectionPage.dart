import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BothDirectionPage extends StatefulWidget {
  @override
  _BothDirectionPageState createState() => _BothDirectionPageState();
}

class _BothDirectionPageState extends State<BothDirectionPage> {
  double _top = 0.0;
  double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件竞争机制"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: FlutterLogo(
                size: 100,
              ),
              onVerticalDragUpdate: (DragUpdateDetails e){
                setState(() {
                  _top += e.delta.dy;
                });
                print("垂直胜出");
              },
              onHorizontalDragUpdate: (DragUpdateDetails e){
                setState(() {
                  _left += e.delta.dx;
                });
                print("水平胜出");
              },
              onTapDown: (e){
                print(e);
              },
              onTapUp: (e){
                print(e);
              },
              onHorizontalDragEnd: (e){
                print(e);
              },
              onVerticalDragEnd: (e){
                print(e);
              },
            )
          )
        ],
      ),
    );
  }
}
