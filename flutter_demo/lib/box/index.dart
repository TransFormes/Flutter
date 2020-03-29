import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BoxPage extends StatefulWidget {
  @override
  _BoxPageState createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> with WidgetsBindingObserver{
  VideoPlayerController _videoPlayerController;
  bool _isPlay = false;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    _videoPlayerController = VideoPlayerController.network("https://xuanfu-files.oss-cn-hangzhou.aliyuncs.com/20191230/1577699391055721.mp4");
    _videoPlayerController.addListener(() { });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize().then((value){
      setState(() {
      });
    });
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {  
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。  
        print('这个是状态11111111');  
      break; case AppLifecycleState.resumed:// 应用程序可见，前台  
        _videoPlayerController.play(); 
      break; case AppLifecycleState.paused: // 应用程序不可见，后台  
        _videoPlayerController.pause();
      break; case AppLifecycleState.detached:  
              print('这个是状态44444>>>>...好像是断网了');  
      break;  
    } 
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: InkWell(
              child:VideoPlayer(_videoPlayerController),
              onTap: (){
                if(_isPlay){
                  _videoPlayerController.pause();
                }else{
                  _videoPlayerController.play();
                }
                setState(() {
                  _isPlay = !_isPlay;
                });
              },
            )
          ),
          Positioned(
            child: _isPlay ? Text("") :Image.network("http://oss.xuanfuai.com/user/play.png",width: 50,height: 60,),
            top: 245,
            left: 153,
          )
        ],
      ),
    );
  }
}
