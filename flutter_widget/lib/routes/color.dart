import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  static Color _widget = Color(0xFFFFFF);
  static MaterialColor wite = MaterialColor(0xFFFFFF, 
    <int, Color>{
      50: _widget,
      100: _widget,
      200: _widget,
      300: _widget,
      350: _widget,
      400: _widget,
      500: _widget,
      600: _widget,
      700: _widget,
      800: _widget,
      850: _widget,
      900: _widget,
    }
  );
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue
      ),
      child: Scaffold(
        appBar: AppBar(title:Text('颜色')),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: NavBar(color: Colors.white, title: '标题'),
            )
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final String title;
  final Color color;
  NavBar({
    Key key,
    this.color,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(color: Colors.black26,offset: Offset(0, 3),blurRadius: 3)
        ]
      ),
      child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black),),
      alignment: Alignment.center,
    );
  }
}