import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  DateTime _lastTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("webView")),
      body: WebView(
        initialUrl: "http://192.168.0.250/",
      )
    );
  }
}