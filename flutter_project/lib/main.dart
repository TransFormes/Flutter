import 'dart:async';
import 'package:flutter/material.dart';
import './errorReport.dart';

void main() async{
  bool isInDebugMode = false;
  FlutterError.onError = (FlutterErrorDetails details){
    if(isInDebugMode){
      FlutterError.dumpErrorToConsole(details);
    }else{
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
  runZoned<Future<Null>>(()async{
    runApp(MaterialApp(home: TextViewExample()));
  }, onError: (error, stackTrace)async{
    await FlutterCrashReport().reportCrash(error, stackTrace);
  });
}
class TextViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("错误日志上报")),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: (){
                final crash = List()[69];
                debugPrint(crash);
              },
              child: Text("Crash"),
            ),
          ),
          RaisedButton(
            child: Text("dart exception"),
            elevation: 1,
            onPressed: (){
              try{
                throw StateError("this is a dart exception");
              } catch(err){
                debugPrint("错误日志:" + err.toString());
                FlutterCrashReport().log('错误日志捕获：', priority: 200, tag: 'test');
                FlutterCrashReport().logException(err, err.stackTrace);
              }
            }
          ),
          Center(
            child: RaisedButton(
              child: Text("Manual error log"),
              onPressed: (){
                try {
                  final crash = List()[144];
                  debugPrint(crash);
                } catch (error) {
                  debugPrint("捕获到异常：" + error.toString());
                  FlutterCrashReport()
                      .log('错误日志捕获：', priority: 200, tag: 'test');
                  FlutterCrashReport().logException(error, error.stackTrace);
                }
              }
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                try {
                  throw new FormatException();
                } catch (exception, stack) {
                  debugPrint("捕获到异常：" + exception.toString());
                  FlutterCrashReport().logException(exception, stack);
                }
              },
              child: Text('Manual exception log'),
            )
          ),
          RaisedButton(
            child: Text('async Dart exception'),
            elevation: 1.0,
            onPressed: ()async{
              foo() async {
                throw new StateError('This is an async Dart exception.');
              }
              bar() async {
                await foo();
              }
              await bar();
            }
          )
        ],
      ),
    );
  }
}