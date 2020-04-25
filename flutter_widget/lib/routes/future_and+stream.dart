import 'dart:async';
import 'package:flutter/material.dart';

class FutureAndStreamPage extends StatefulWidget {
  @override
  _FutureAndStreamPageState createState() => _FutureAndStreamPageState();
}

class _FutureAndStreamPageState extends State<FutureAndStreamPage> {
  var t = Future.delayed(Duration(seconds: 3),() => "我时候数据");
  Stream<int> counter(){
    return Stream.periodic(Duration(seconds: 1),(i){
      return i;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('future_and_stream'),),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter(), //
          //initialData: ,// a Stream<int> or null
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
            }
            return null; // unreachable
          },
        ),
      )
    );
  }
}