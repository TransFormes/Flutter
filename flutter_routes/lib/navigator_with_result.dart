import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("参数回传")),
      body: Center(
        child:  SelectTionBotton(),
      ),
    );
  }
}
class SelectTionBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("选择课程"),
      onPressed: (){
        _select(context);
      },
    );
  }
  _select(BuildContext context) async{
    final res = await Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (BuildContext context){
      return SelectScreen();
    }) , (route) => true);
    print(res);
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$res")));
  }
}
class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("请选择")),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pop(context, 'Andriod');
                },
                child: Text("Android"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pop(context, 'Ios');
                },
                child: Text("Ios")
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pop(context, 'Flutter');
                },
                child: Text("Flutter")
              ),
            )
          ],
        ),
      ),
    );
  }
}