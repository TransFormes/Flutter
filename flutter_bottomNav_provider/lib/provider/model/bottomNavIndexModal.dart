import 'package:flutter/material.dart';

class BottomNavBarProvider with ChangeNotifier{
  int _current = 0;
  get currentIndex => _current;
  set currentIndex(int index){
    _current = index;
    notifyListeners();
  }
}