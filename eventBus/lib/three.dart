import 'package:flutter/material.dart';
import './event.dart';

class Three extends StatefulWidget {
  @override
  _ThreeState createState() => _ThreeState();
}

class _ThreeState extends State<Three> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    print('第三个页面初始化');
    // TODO: implement initState
    super.initState();
    this.playVideo(true);
    eventBus.on('eventName', (arg) { 
      if(arg == 2){
        playVideo(true);
      } else {
        playVideo(false);
      }
    });
  }
  playVideo(bool isPlay){
    print('第三个页面显示:${isPlay}');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eventBus.off('eventName');
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('第二个页面'),
    );
  }
}