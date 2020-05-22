import 'package:flutter/material.dart';

class Four extends StatefulWidget {
  @override
  _FourState createState() => _FourState();
}

class _FourState extends State<Four> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Four');
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Four'),
    );
  }
}