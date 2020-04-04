import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _userName, passWord;
  // LoginPagePresenter _pagePresenter;
  // _LoginPageState(){
  //   _pagePresenter = LoginPagePresenter(this);
  // }
  void _submit(){
    final form = formKey.currentState;
    if(form.validate()){
      _showSnackBar("登录成功");
      setState(() {
        _isLoading = true;
        form.save();
      });
    }else{
      print("失败");
      _showSnackBar("登录失败");
    }
  }
  void _showSnackBar(String text){
    print(scaffoldKey.currentState);
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(text)),
      );
  }
  @override
  void onLoginError(String error){
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void onLoginSuccess(){
    _showSnackBar("登录成功" + _userName);
    setState(() {
      _isLoading = false;
    });
  }
  Widget loginBtn(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5,
        child: MaterialButton(
          minWidth: 200,
          height: 42,
          color: Colors.black54,
          onPressed: _submit,
          child: Text("登录",style: TextStyle(
            color: Colors.white,fontSize: 20
          ),),
        ),
      ),
    );
  }
  Widget loginForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Form(
          autovalidate: true,
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  onSaved: (val) => _userName = val,
                  decoration: InputDecoration(
                    labelText: "用户名"
                  ),
                  validator: (v){
                    return v.trim().length > 0 ? null : '用户名不能为空';
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  onSaved: (val) => passWord = val,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "密码",
                  ),
                  validator: (v){
                    return v.trim().length > 0 ? null : '密码不能为空';
                  },
                ),
              ),
              loginBtn()
            ],
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Scaffold(
      appBar: AppBar(title: Text("登录")),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: loginForm(),
        ),
      ),
    );
  }
}