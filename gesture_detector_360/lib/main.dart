import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestureDetector实现360展物',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestureDetectorPage(title: 'GestureDetector实现360展物'),
    );
  }
}
class GestureDetectorPage extends StatefulWidget {
  GestureDetectorPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  int index = 1;
  int count = 72;
  double initial = 0.0;
  final int DIRECTION_ANTICLOCKWISE = 1;
  final int DIRECTION_CLOCKWISE = -1;
  int direction;
  Timer _timer;
  // Timer _timers;

  @override
  void initState() {
    // TODO: implement initState
    // _timers = Timer.periodic(Duration(seconds: 1), (timer) { 
    //   print("定时器");
    // });
    super.initState();
    direction = DIRECTION_CLOCKWISE;
    _startTimer();
  }
  _startTimer(){
    _timer = Timer.periodic(Duration(milliseconds: 90),(timer){
      setState(() {});
      if(direction == DIRECTION_ANTICLOCKWISE){
        if(index >1){
          index --;
          return;
        }
        index = count;
      }else if(direction == DIRECTION_CLOCKWISE){
        if(index < count){
          index++;
          return;
        }
        index = 1;
      }
    });
  }
  void _onTouchImage(e){
    if(e.delta.dx <0){
      direction = DIRECTION_CLOCKWISE;
    }
    if(e.delta.dx > 0){
      direction = DIRECTION_ANTICLOCKWISE;
    }
    setState(() {
      index -= e.delta.dx.toInt();
    });
    if(index < 1){
      index = 1;
    }
    if(index > count){
      index = count;
    }
  }
  @override
  dispose(){
    super.dispose();
    _cancelTimer();
    // _timers.cancel();
  }
  void _cancelTimer(){
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => _cancelTimer(),
              onPanStart: (e) => _cancelTimer(),
              onPanEnd: (e) => _startTimer(),
              child: Image.asset(
                'images/product00${index}.png',
                width: width,
                height: width,
                // 该属性防止图片快速切换时白屏发生，在新图出前时保持旧的图
                gaplessPlayback: true,
                excludeFromSemantics: true
              ),
            )
          ],
        ),
      ),
    );
  }
}