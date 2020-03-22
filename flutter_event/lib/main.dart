import 'package:flutter/material.dart';
import './index.dart';
import './listenerPage.dart';
import './pointer_event_ignore_page.dart';
import './gestureDetectorPage.dart';
import './dragPage.dart';
import './scalePage.dart';
import './gestureRecognizerPage.dart';
import './bothDirectionPage.dart';
import './scrollStatusPage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter事件处理',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/Listener': (context) => ListenerPage(),
        '/PointerEvent': (context) => PointerEventIgnorePage(),
        '/GestureDetector': (context) => GesTureDetectorPage(),
        '/Drag': (context) => DragPage(),
        '/Scale': (context) => ScalePage(),
        '/GestureRecognizer': (context) => GestureRecognizerPage(),
        '/BothDirection': (context) => BothDirectionPage(),
        '/NotificationListener': (context) => ScrollStatusPage()
      },
      home: IndexPage(),
    );
  }
}