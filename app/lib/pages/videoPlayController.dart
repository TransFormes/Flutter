import 'dart:async';
import 'package:flutter/material.dart';
import './../event_bus.dart';
import 'package:video_player/video_player.dart';
import './../compontents/right.dart';

class VideoController extends StatefulWidget {
  String image;
  final int positionTag;
  String video;
  VideoController({
    Key key,
    this.image,
    this.positionTag,
    this.video
  }):super(key:key);
  @override
  _VideoControllerState createState() => _VideoControllerState();
}

class _VideoControllerState extends State<VideoController> {
  ScrollController scroController = ScrollController();
  Timer timer;
  bool videoPrepared = false;
  bool _hideActionButton = true;
  VideoPlayerController _controller;

  // static double h = Platform.isAndroid ? (16 / 9 * Screen)
  void startTimer(){
    int time = 3000;
    timer = Timer.periodic(Duration(milliseconds: time), (timer){
      if(scroController.positions.isNotEmpty == false){
        print('界面销毁');
        return;
      }
      double maxScrollExtent = scroController.position.maxScrollExtent;
      if(maxScrollExtent > 0){
        scroController.animateTo(maxScrollExtent, 
        duration: Duration(milliseconds: (time * 0.5).toInt()), curve: Curves.linear);
        Future.delayed(Duration(milliseconds: (time * 0.5).toInt()),(){
          if(scroController.positions.isNotEmpty == true){
            scroController.animateTo(0, duration: Duration(milliseconds: (time * 0.5).toInt()), curve: Curves.linear);
          }
        });
      }else{
        print('不需要移动');
        timer.cancel();
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.startTimer();
    _controller = VideoPlayerController.asset(widget.video)
    ..initialize().then((value) => null)..setLooping(true).then((value){
      if(widget.positionTag == 0){
        _controller.play();
        videoPrepared = true;
      }else{
        videoPrepared = false;
      }
      // setState(() {
        
      // });
    });
    eventBus.on(keyPlayVideo + widget.positionTag.toString(), (arg) { 
      if(arg == widget.positionTag){
        _controller.play();
        videoPrepared = true;
        _hideActionButton = true;
      }else{
        _controller.pause();
        _hideActionButton = false;
      }
    });
  }
  @override
  void dispose() { 
    this.scroController.dispose();
    this.timer.cancel();
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return getVideoViewMain();
  }
  Widget getVideoViewMain(){
    return Stack(
      children: <Widget>[
        GestureDetector(
          child: Stack(
           children: <Widget>[
             Container(
               margin: EdgeInsets.only(top: 20),
               width: MediaQuery.of(context).size.width,
               height: 1334,
               child: VideoPlayer(_controller),
             ),
             getPauseView()
           ], 
          ),
          onTap: (){
            if(_controller.value.isPlaying){
              _controller.pause();
              _hideActionButton = false;
            }else{
              _controller.play();
              _hideActionButton = true;
              videoPrepared = true;
            }
          },
        ),
        getPreviewImg(),
        getLikesView(),
        this.getUserAndTitle()
      ],
    );
  }
  getPauseView(){
    return Offstage(
      offstage: _hideActionButton,
      child: Stack(
        children: <Widget>[
          Align(
            child: Container(
              child: Image.network('http://oss.xuanfuai.com/user/play.png'),
              height: 50,
              width: 50,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }
  Widget getPreviewImg(){
    return Offstage(
      offstage: videoPrepared,
      child: Container(
        color: Colors.black,
        margin: EdgeInsets.only(top: 20),
        child: Image.asset(widget.image,fit: BoxFit.fill),
        width: 750,
        height: 1334,
      ),
    );
  }
  Widget getMusicTitle(){
    return Container(
      child: Text('三根皮带歌曲,哗啦啦啦啦啦啦啦啦啦啦啦',maxLines: 1,style: TextStyle(color: Colors.white),textAlign: TextAlign.left)
    );
  }
  Widget getUserAndTitle(){
    return Positioned(
      bottom: 60,
      child: Padding(
        padding: EdgeInsets.only(left: 5, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text('@Admin',style: TextStyle(color: Colors.white)),
            ),
            Container(
              padding: const EdgeInsets.only(bottom:5),
              width: 250,
              child: Text('内容',style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              width: 200,
              height: 25,
              child: ListView(
                controller: scroController,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[this.getMusicTitle()],
              ),
            )
          ],
        ),
      )
    );
  }
}