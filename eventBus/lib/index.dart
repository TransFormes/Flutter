import 'package:flutter/material.dart';
import './event.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    print('第一个页面初始化');
    // TODO: implement initState
    super.initState();
    playVideo(true);
    eventBus.on('eventName', (arg) { 
      if(arg == 0){
        playVideo(true);
      } else {
        playVideo(false);
      }
    });
  }
  playVideo(bool isPlay){
    print('第一个页面显示:${isPlay}');
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