import 'package:flutter/material.dart';
class TextFieldKeyBoardFix extends StatefulWidget {
  @override
  _TextFieldKeyBoardFixState createState() => _TextFieldKeyBoardFixState();
}

class _TextFieldKeyBoardFixState extends State<TextFieldKeyBoardFix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('底部弹出遮挡输入框解决方案'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: RaisedButton(
            child: Text("弹起键盘"),
            onPressed: (){
              // 底部弹出框
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, 
                builder: (context) => KeyboardTestWidget()
              ).then((value) => null);
            },
          ),
        ),
      ),
    );
  }
}
class KeyboardTestWidget extends StatelessWidget {
  const KeyboardTestWidget({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "address"
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}