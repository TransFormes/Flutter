import 'package:flutter/material.dart';
class AnimatedBuilderPage extends StatefulWidget {
  AnimatedBuilderPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage> with SingleTickerProviderStateMixin {
  
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(
      milliseconds: 2000
    ));
    final CurvedAnimation curve = CurvedAnimation(
      parent: controller, 
      curve: Curves.bounceIn
    );
    animation = Tween(
      begin: 0.0,end: 300.0
    ).animate(curve)..addStatusListener((status) {
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
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: LogoWidget(),
      animation: animation
    );
  }
}
class LogoWidget extends StatelessWidget{
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget{
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("曲线动画")),
      body: Center(
        child: AnimatedBuilder(
          animation: animation, 
          builder: (BuildContext context, Widget child){
            return Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child,
        ),
      ),
    );
  }
}