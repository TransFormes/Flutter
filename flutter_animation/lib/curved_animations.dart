import 'package:flutter/material.dart';
class CuredAnimations extends StatefulWidget {
  @override
  _CuredAnimationsState createState() => _CuredAnimationsState();
}

class _CuredAnimationsState extends State<CuredAnimations> with SingleTickerProviderStateMixin {
  
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2), vsync: this
    );
    animation = CurvedAnimation(
      parent: controller,curve: Curves.bounceIn
    )..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
     });
     controller.forward();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("曲线动画"),),
      body: AnimatedLogo(animation:animation),
    );
  }
}
class AnimatedLogo extends AnimatedWidget{
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0.1, end: 1);
  AnimatedLogo({Key key,Animation<double> animation}):super(key: key, listenable: animation);
  Widget build(BuildContext context){
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlutterLogo(
          ),
        ),
      ),
    );
  }
}