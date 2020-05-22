import 'package:flutter/material.dart';

class Three extends StatefulWidget {
  @override
  _ThreeState createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Three');
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Three'),
    );
  }
}