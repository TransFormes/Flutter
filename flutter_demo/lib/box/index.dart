import 'package:flutter/material.dart';

class BoxPage extends StatefulWidget {
  @override
  _BoxPageState createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("盒子"),),
      body: Center(
        child: Text("盒子"),
      ),
    );
  }
}