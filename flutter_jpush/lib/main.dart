import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String debugLable = 'Unknown';   //错误信息
  final JPush jpush = JPush();  //初始化极光插件
  @override
  void initState() {
    super.initState();
    initPlatformState();  //极光插件平台初始化
  }


  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      //监听响应方法的编写
      jpush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async {
          print(">>>>>>>>>>>>>>>>>flutter 接收到推送: $message");
          setState(() {
            debugLable = "接收到推送: $message";
          });
        }
      );

    } on PlatformException {
      platformVersion = '平台版本获取失败，请检查！';
    }


    if (!mounted) return;

    setState(() {
      debugLable = platformVersion;
    });
  }



// 编写视图
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('极光推送'),
        ),
        body: Center(
            child: Column(
                children:[
                  Text('结果: $debugLable\n'),
                  FlatButton(
                      child: Text('发送推送消息\n'),
                      onPressed: () {
                        // 三秒后出发本地推送
                        var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 3000);
                        var localNotification = LocalNotification(
                            id: 234,
                            title: '标题',
                            buildId: 1,
                            content: '看到了说明已经成功了',
                            fireTime: fireDate,
                            subtitle: '一个测试',
                        );
                        jpush.sendLocalNotification(localNotification).then((res) {
                          setState(() {
                            debugLable = res;
                          });
                        });

                      }),

                ]
            )
        ),
      ),
    );
  }
}