import 'package:flutter/material.dart';
import './../components/gradinetButton.dart';

class GradientButtonPage extends StatefulWidget {
  @override
  _GradientButtonPageState createState() => _GradientButtonPageState();
}

class _GradientButtonPageState extends State<GradientButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GradientButtonPage'),),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              height: 50,
              colors: [Colors.lightGreen, Colors.green[700]],
              child: Text('submit'),
              onPressed: onTap,
            ),
            GradientButton(
            height: 50.0,
            colors: [Colors.lightGreen, Colors.green[700]],
            child: Text("Submit"),
            onPressed: onTap,
          ),
          GradientButton(
            height: 50.0,
            colors: [Colors.lightBlue[300], Colors.blueAccent],
            child: Text("Submit"),
            onPressed: onTap,
          ),
          ],
        ),
      ),
    );
  }
  onTap(){
    print('click');
  }
}