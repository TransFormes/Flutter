import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _nameConstroller = TextEditingController();
  TextEditingController _weatherController = TextEditingController();
  FocusScopeNode focusScopeNode;
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameConstroller.addListener(() { 
      print(_nameConstroller.text);
    });
    _weatherController.text = "今天下雨了";
    _weatherController.selection = TextSelection(baseOffset: 3, extentOffset: _weatherController.text.length);
  }
  void _toast(){
    Fluttertoast.showToast(
      msg: "登录成功",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,  // 消息框弹出的位置
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
  @override
  void dispose() { 
    _nameConstroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("TextField")),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18,color:Colors.blue),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Text("TextField"),
              TextField(
                controller: _nameConstroller,
                maxLines: 1,
                focusNode: _nameFocusNode,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              TextField(
                maxLines: 1,
                focusNode: _passwordFocusNode,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock)
                ),
                onChanged: (v) => print("输入的密码"),
                obscureText: true,
              ),
              RaisedButton(
                child: Text("移动到密码焦点"),
                onPressed: (){
                  // if(null == focusScopeNode){
                  //   focusScopeNode = FocusScope.of(context);
                  // }
                  focusScopeNode.requestFocus(_passwordFocusNode);
                }
              ),
              SizedBox(height: 30,),
              Text("修改光标属性"),
              TextField(
                cursorWidth: 10,
                cursorRadius: Radius.circular(5),
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  labelText: "登录",
                  hintText: "请输入密码"
                ),
              ),
              SizedBox(height: 30,),
              Text("constroll使用"),
              TextField(
                controller: _weatherController,
                decoration: InputDecoration(
                  labelText: "天气",
                  hintText: "今天的天气情况"
                ),
              ),
              SizedBox(height: 30,),
              Text("form表单"),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameConstroller,
                      maxLines: 1,
                      validator: (val) => (val == null || val.isEmpty) ? "用户名不能为空" : null,
                      focusNode: _nameFocusNode,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "请输入用户名",
                        prefixIcon: Icon(Icons.person)
                      ),
                    ),
                    TextFormField(
                      maxLines: 1,
                      // focusNode: _passwordFocusNode,
                      validator: (val) => (val == null || val.isEmpty) ? "密码不能为空" : null,
                      decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "请输入密码",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      onChanged: (v) => print("您输入的密码是 $v"),
                      obscureText: true,
                    ),
                    RaisedButton(
                      child: Text("提交表单"),
                      onPressed: (){
                        final formState = _formKey.currentState as FormState;
                        if(formState.validate()){
                          // AlertDialog(
                          //   title: Text("提示"),
                          //   content: Text("提交成功"),
                            
                          // );
                          _toast();
                          // Fluttertoast.showToast(msg: "提交成功",toastLength: Toast.LENGTH_SHORT,);
                          // formState.save();
                        }
                      }
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}