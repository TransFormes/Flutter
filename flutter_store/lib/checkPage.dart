import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  CheckPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final TextEditingController textEditingController = TextEditingController();
  void _save(){
    print(textEditingController.text);
  }
  void _remove(){
    setState(() {
      textEditingController.text = "";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "请输入用户名"
              ),
            ),
            RaisedButton(
              child: Text("保存"),
              onPressed: _save
            ),
            RaisedButton(
              child: Text("清除"),
              onPressed: _remove
            )
          ],
        ),
      ),
    );
  }
}