import 'package:flutter/material.dart';

class Store extends ChangeNotifier {
  int count = 0;
  String name = '张三';
  setName(String value){
    name = value;
    notifyListeners();
  }
  setNumber(int number){
    count = number;
    notifyListeners();
  }
}