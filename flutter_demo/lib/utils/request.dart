import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './../login/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './tool.dart';

Future request(String method, String url, formData, bool tips, bool showLoading) async{
  SharedPreferences intance = await SharedPreferences.getInstance();
  Response response;
  BaseOptions options = BaseOptions(
    //请求基地址,可以包含子路径
      baseUrl: 'http://192.168.0.0',
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      headers: {
        "token": intance.get('token')
      },
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      contentType: 'application/x-www-form-urlencoded'
  );
  Dio dio = Dio(options);
  if(method == 'get'){
    response = await dio.get(url,queryParameters: formData);
  }else{
    response = await dio.post(url, data: formData);
  }
  if(response.statusCode == 200){
    if(response.data.code == 200){
      return response.data;
    }else if(response.data.code == 202){
      toast(response.data.msg);
      MaterialPageRoute(
        builder: (context){
          return LoginPage();
        }
      );
    }else {
      if (url == 'xuanfu-sso/sso/user/login/wechat') {
        Map data = {
          'err': 0
        };
        return data; 
      }
      if (url != 'xuanfu-express/express/searchTraces') {
        toast(response.data.msg);
      }
    }
  }else {
    toast('前方拥堵，请换一换');
  }
}