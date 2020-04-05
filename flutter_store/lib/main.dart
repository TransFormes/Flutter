import 'package:flutter/material.dart';
import './share_preferences.dart';
import './storePage.dart';
import './checkPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '持久化',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/SharedPreferences': (context) =>
            SharedPreferencesPage(),
        '/CheckInPage': (context) => CheckPage(title: '用户打卡'),
      },
      home: StorePage(),
    );
  }
}