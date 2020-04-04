import './../utils/network_util.dart';
import './../modal/user.dart';
import 'dart:convert';
import 'package:flutter/material.dart';


class RestData{
  NetworkUtil _networkUtil = NetworkUtil();
  static final BASE_URL = "http://172.20.10.3:3000";
  static final LOGIN_URL = BASE_URL + "/user/login";
  Future<User> login(String username, String password) async{
    // final 
  }
}