import 'package:flutter/material.dart';
class MainPage extends StatelessWidget {
  final List<String> list = [
    'curved',
    'Tween',
    'Loading',
    'fade',
    'AnimatedBuilder',
    'Hero',
    'StaggerAnimation',
    'AnimatedSwitcher '
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("动画演示")),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            title: GestureDetector(
              child: Text(list[index]),
              onTap: (){
                Navigator.pushNamed(context, "/${list[index]}");
              },
            ),
          );
        }
      ),
    );
  }
}