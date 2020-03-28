
import 'package:flutter/cupertino.dart';
import './../login/index.dart';
import './../test.dart';

final Map<String, WidgetBuilder> routes = {
  "/login": (context) => LoginPage(),
  "/test": (context) => TestPage()
};