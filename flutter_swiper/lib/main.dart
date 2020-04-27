import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'swiper',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home: MainHome(),
    );
  }
}
class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<String> list = [
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    // 'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          // return FutureBuilder(
          //   future: Future.delayed(Duration(seconds: 3)),
          //   builder: (contetx, snap){
          //     print(snap.connectionState);
          //     if(snap.connectionState == ConnectionState.waiting){
          //       return CircularProgressIndicator();
          //     } else if(snap.connectionState == ConnectionState.done){
          //       return Image.network(list[index],fit: BoxFit.cover,width: 750,height: 1330,);
          //     }
          //     return Text('error');
          //   }
          // );
          return Image.network(list[index],fit: BoxFit.cover,width: 750,height: 1330,);
        },
        controller: SwiperController(),
        onIndexChanged:(int index){
          print(index);
        },
        loop: false
      ),
    );
  }
}