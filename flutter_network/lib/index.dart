import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final List<String> list = [
    'HttpClient'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("网络编程")),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(list[index]),
            onTap: (){
              Navigator.pushNamed(context, list[index]);
            },
          );
        }
      ),
    );
  }
}