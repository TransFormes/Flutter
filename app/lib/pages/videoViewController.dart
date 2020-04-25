import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import './../event_bus.dart';
import './videoPlayController.dart';

class VideoViewController extends StatefulWidget {
  @override
  _VideoViewControllerState createState() => _VideoViewControllerState();
}

class _VideoViewControllerState extends State<VideoViewController> {
  SwiperController _controller = SwiperController();
  List images = [
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633411833175.jpg',
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631982283967.jpg',
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631918519673.jpg'
  ];
  List videos = [
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587633322953437.mp4',
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631974274326.mp4',
    'https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20200423/1587631914092781.mp4'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() { 
      print(_controller.page);
      if(_controller.page.floor() == _controller.page){
        eventBus.emit(keyPlayVideo + _controller.page.floor().toString(), _controller.page.floor());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    int index = 0;
    for (String item in this.images) {
      children.add(VideoController());
    }
    return Scaffold(
      body: Container(
        child: Swiper(
          children: children,
          autoStart: false,
          circular: false,
          direction: Axis.vertical,
          controller: _controller,
        ),
      ),
    );
  }
}