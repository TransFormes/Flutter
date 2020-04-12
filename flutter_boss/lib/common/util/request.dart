import 'package:dio/dio.dart';
import 'dart:async';
import './../config/config.dart';

class Request {
  static final Request _httpUtil = Request._internal();
  Dio _client;
  
  factory Request() => _httpUtil;

  Request._internal(){
    if(_client == null){
      BaseOptions options = BaseOptions(
        baseUrl: "${Config.BASE_URL}",
        connectTimeout: 1000 * 10,
        receiveTimeout: 3000
      );
      _client = Dio(options);
    }
  }
  Future<Response<Map<String, dynamic>>> get(String path, [Map<String, dynamic> params]) async {
    Response<Map<String, dynamic>> response;
    if (null != params) {
      response = await _client.get(path, queryParameters: params);
    } else {
      response = await _client.get(path);
    }
    return response;
  }
}