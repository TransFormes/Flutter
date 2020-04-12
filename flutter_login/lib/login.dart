import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './index.dart';

class LoginPage extends StatefulWidget {
  static String tag = "login-page";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() { 
    super.initState();
    showText();
  }
  void showText(){
    Fluttertoast.showToast(
      msg: "11111111111c",
      toastLength: Toast.LENGTH_SHORT,
      webBgColor: "#e74c3c",
      timeInSecForIosWeb: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Hero组件特点 页面A有个圆形头像，页面B也有个圆形头像，头像图片是同一个。从A跳转到B时，一般都是硬性跳转，两个头像之间没有任何关系。而Hero的作用是：在跳转过程中，实现从A的头像过渡到B的头像的效果。
    // 关键点 两个页面的头像都需要用Hero包裹住。 两个Hero的tag要一致。
    final logo = Hero(
      tag: "hreo", 
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48,
        child: Image.asset("assets/logo.png"),
      )
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: "123456789@qq.com",
      decoration: InputDecoration(
        hintText: "Email",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32)
        )
      ),
    );
    final pwd = TextFormField(
      autofocus: false,
      initialValue: "请输入密码",
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Pwd",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32)
        )
      ),
    );
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical:16),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        // shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5,
        child: MaterialButton(
          minWidth: 200,
          height: 42,
          onPressed: (){
            Navigator.of(context).pushNamed(IndexPage.tag);
          },
          color: Colors.green,
          child: Text("登 录",style: TextStyle(color:Colors.white,fontSize: 18),),
        ),
      ),
    );
    final forgotLabel = FlatButton(
      onPressed: null, 
      child: Text("忘记密码？",style: TextStyle(color:Colors.black54,fontSize: 18),),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left:24,right:24),
          children: <Widget>[
            logo,
            SizedBox(height: 48,),
            email,
            SizedBox(height: 8,),
            pwd,
            SizedBox(height: 24,),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}