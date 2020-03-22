import 'package:flutter/material.dart';
class GesTureDetectorPage extends StatefulWidget {
  @override
  _GesTureDetectorPageState createState() => _GesTureDetectorPageState();
}

class _GesTureDetectorPageState extends State<GesTureDetectorPage> {
  String _opName = "未检测到操作";
  void _showEventText(String text) {
    setState(() {
      _opName = text;
    });
    print(_opName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureDetector手势识别"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 240,
            height: 120,
            child: Text(_opName, style: TextStyle(color: Colors.white),),
          ),
          onTap: () => _showEventText("Tap"),
          onTapUp: (e) => _showEventText("TapUp"),
          onTapDown: (e) => _showEventText("TapDown"),
          onTapCancel: () => _showEventText("TapCancel"),
          onDoubleTap: () => _showEventText("DoubleTap"),
          onLongPress: () => _showEventText("LongPress"),
          onVerticalDragDown: (e) => _showEventText("onVerticalDragDown"),
          onVerticalDragStart: (e) => _showEventText("onVerticalDragStart"),
          onVerticalDragUpdate: (e) => _showEventText("onVerticalDragUpdate"),
          onVerticalDragEnd: (e) => _showEventText("onVerticalDragEnd"),
          onVerticalDragCancel: () => _showEventText("onVerticalDragCancel"),
          onHorizontalDragDown: (e) => _showEventText("onHorizontalDragDown"),
          onHorizontalDragStart: (e) => _showEventText("onHorizontalDragStart"),
          onHorizontalDragUpdate: (e) => _showEventText("onHorizontalDragUpdate"),
          onHorizontalDragEnd: (e) => _showEventText("onHorizontalDragEnd"),
          onHorizontalDragCancel: () => _showEventText("onHorizontalDragCancel"),
        ),
      ),
    );
  }
}