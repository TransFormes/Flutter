import 'package:flutter/material.dart';
import './page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "路由",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("我是首页"),
            RaisedButton(
              child: Text("详情"),
              onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NextPage(
                          // 路由参数
                          id: "dasdas11111111111111111111111",
                        );
                      },
                    ),
                  );
                // print(res);
              },
            )
          ],
        ),
    );
  }
}