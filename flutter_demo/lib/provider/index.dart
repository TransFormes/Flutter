import 'package:flutter/material.dart';

class Store extends ChangeNotifier{
  String userId = "";
  String invitedId = "";
  int nums = 5;

  setValue(String key, String value){
    print("${key}: ${value}");
    key = value;
    notifyListeners();
  }
}