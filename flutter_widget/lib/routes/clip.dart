import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  Widget avatar = Image.network('https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJpbicpMGy73vACxHzrJBrOlMB51FqqxAWvngnKF0tBJGCcSdhyoAfCsiaNTsDanUvPqRRgl2d7qUrg/132',width: 60,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('clip')),
      body: Column(
        children: <Widget>[
          avatar,
          ClipOval(
            child: avatar,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,
                child: avatar,
              ),
              Text('hello world',style:TextStyle(color: Colors.green)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
              ),
              Text('hello world',style: TextStyle(color: Colors.green),)
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: ClipRect(
              clipper: MyClipper(),
              child: avatar,
            ),
          )
        ].map((e) => Padding(padding: EdgeInsets.only(top: 16), child: e))
        .toList()
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10, 15, 40, 30);
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}