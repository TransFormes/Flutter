import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BoxPage extends StatefulWidget {
  @override
  _BoxPageState createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {
  VideoPlayerController _videoPlayerController;
  bool _isPlay = false;
  @override
  void initState() {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _videoPlayerController.play();
  }
  @override
  void dispose() {
    super.dispose();
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
            child: _isPlay ? null :Image.network("http://oss.xuanfuai.com/user/play.png",width: 50,height: 60,),
            top: MediaQuery.of(context).size.width / 2,
            left: MediaQuery.of(context).size.height / 2,
          )
        ],
      ),
    );
  }
}
