import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';




class NextPage extends StatefulWidget {
  NextPage({Key key,this.id}):super(key: key);
  final String id;
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {

  Future _getData() async{
    Dio request = Dio();
    request.options.headers = {
      "token": "pc|local|f2c70e4eeb094f6d97df"
    };
    Response response = await request.get("http://192.168.0.20/xuanfu-manage/colorLabel/select");
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // Text(widget.id),
          Text("dasdsa"),
          RaisedButton(
            child: Text(widget.id),
            onPressed: (){
              Navigator.pop(context,"我是返回值");
            },
          ),
          RaisedButton(
            child: Text("获取数据"),
            onPressed: (){
              _getData();
            }
          )
        ],
      ),
    );
  }
}