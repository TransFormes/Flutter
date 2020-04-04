import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class HttpClientTest extends StatefulWidget {
  @override
  _HttpClientTestState createState() => _HttpClientTestState();
}

class _HttpClientTestState extends State<HttpClientTest> {
  String _responseText = "";
  Future _loadData() async{
    try{
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://www.phei.com.cn"));
      HttpClientResponse response = await request.close();
      _responseText = await response.transform(Utf8Decoder()).join();
      print(_responseText);
      httpClient.close();
    }catch(_){
      print('请求异常' + _.toString());
    }
  }
  Future _loadPost() async{
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse("https://www.phei.com.cn"));
      request.headers.set("content-type", "application/json");
      Map data = {
        'userid': 1000
      };
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      _responseText = await response.transform(Utf8Decoder()).join();
      print(_responseText);
    }catch(err){
      print("错误" + err.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("httpClient")),
      body: Center(
        child: FlatButton(
          child: Text("获取"),
          onPressed: (){
            _loadData();
          },
        ),
      ),
    );
  }
}