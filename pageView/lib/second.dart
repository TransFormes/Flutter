import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Second');
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Second'),
    );
  }
}