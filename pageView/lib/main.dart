import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Page View",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MainPage(),
    );
  }
}
class MainPage extends StatelessWidget {
  Widget _buildPage({int index, Color color}){
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: Text("$index",style: TextStyle(fontSize:150,color: Colors.white)),
    );
  }
  Widget _buildPageView(){
    return PageView(
      children: <Widget>[
        _buildPage(index: 1,color:Colors.green),
        _buildPage(index: 2,color:Colors.blue),
        _buildPage(index: 3,color:Colors.indigo),
      ],
      scrollDirection: Axis.vertical,
      onPageChanged: (int index){
        print(index);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("pageView")),
      body: _buildPageView(),
    );
  }
}