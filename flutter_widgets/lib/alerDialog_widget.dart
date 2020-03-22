import 'package:flutter/material.dart';

enum DialogDemoAction{
  cancel,
  agree
}
const String _alertWithoutTitleText = '确定删除吗？';

class AlertDialogWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showDemoDialog<T>({BuildContext context, Widget child}){
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child
    ).then<void>((T value){
      if(value != null){
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("您选择了$value")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subtitle1.copyWith(color: theme.textTheme.caption.color);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("raisedButton"),
            onPressed: (){
              showDemoDialog<DialogDemoAction>(
                context: context,
                child: AlertDialog(
                  content: Text(_alertWithoutTitleText,style: dialogTextStyle,),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.pop(context, DialogDemoAction.cancel);
                      }, 
                      child: Text("否")
                    ),
                    FlatButton(
                      child: const Text('是'),
                      onPressed: () {
                        Navigator.pop(context, DialogDemoAction.agree);
                      },
                    ),
                  ],
                ),
              );
            }
          )
        ],
      ),
    );
  }
}