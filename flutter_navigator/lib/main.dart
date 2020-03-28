import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import './page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "路由",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomePage(),
    );
  }
}

class SwiperList extends StatelessWidget{
  List<String> list = [
    "images/product001.png",
    "images/product002.png",
    "images/product003.png",
    "images/product004.png",
    "images/product005.png",
    "images/product006.png"
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 750,height: 1334,allowFontScaling:false);
    return Container(
      height: 300,
      child: Swiper(
        itemCount: list.length,
        autoplay: true,
        pagination: new SwiperPagination(),
        itemBuilder: (BuildContext context,int index){
          return Image.asset(list[index],fit: BoxFit.cover,);
        }
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
           SwiperList(),
          // Text('${ScreenUtil().setWidth(750)}'),
          // Text('${ScreenUtil().setHeight(1334)}'),
          RaisedButton(
            onPressed: () async{
              if(await canLaunch("15079283571")){
                await launch("15079283571");
              }else{
                throw 'Could not launch 15079283571';
              }
            },
            child: Text("拨打电话"),
          )
        ],
      ),
    );
  }
}