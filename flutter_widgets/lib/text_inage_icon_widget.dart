import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class TextImageIconWidget extends StatelessWidget {
  // 默认不支持svg 需要使用第三方库
  SvgPicture svg = SvgPicture.network("https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200312/1583993182595994.svg",width: 150,); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Column(
        children: <Widget>[
          Image.network("https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200320/1584674994184202.png",width: 150,fit: BoxFit.contain,),
          svg
        ],
      ),
    );
  }
}