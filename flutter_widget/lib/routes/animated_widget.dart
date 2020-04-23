import 'package:flutter/material.dart';

class AnimatedWidgetPage extends StatefulWidget {
  @override
  _AnimatedWidgetPageState createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage> {
  double _padding = 10;
  double _height = 100;
  double _left = 0;
  Color color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;
  double _opacity = 1;
  var _align = Alignment.topRight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('animatedWidget')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                setState(() {
                  _padding = 20;
                });
              },
              child: AnimatedPadding(
                padding: EdgeInsets.all(_padding), 
                duration: Duration(milliseconds: 400),
                child: Text('animatedPadding'),
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    left: _left,
                    child: RaisedButton(
                      onPressed: (){
                        setState(() {
                          _left = 100;
                        });
                      },
                      child: Text('sizedBox'),
                    ), 
                    duration: Duration(milliseconds: 400),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                alignment: _align, 
                duration: Duration(milliseconds: 400),
                child: RaisedButton(
                  onPressed: (){
                    setState(() {
                      _align = Alignment.center;
                    });
                  },
                  child: Text('AnimatedAlign'),
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: _height,
              color: color,
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    _height = 150;
                    color = Colors.blue;
                  });
                }, 
                child: Text('animatedContainer',style:TextStyle(color: Colors.white))
              ),
            ),
            AnimatedDefaultTextStyle(
              child: GestureDetector(
                child: Text('hello world'),
                onTap: (){
                  setState(() {
                    _style = TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue
                    );
                  });
                },
              ), 
              style: _style, 
              duration: Duration(milliseconds: 400),
            ),
            AnimatedOpacity(
              opacity: _opacity, 
              duration: Duration(milliseconds: 400),
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    _opacity = 0.2;
                  });
                }, 
                child: Text('AnimatedOpacity',style: TextStyle(color: Colors.white),)
              ),
            ),
            AnimatedDecoratedBox(
              duration: Duration(
                milliseconds: _decorationColor == Colors.red ? 400 : 2000),
              decoration: BoxDecoration(color: _decorationColor),
              child: Builder(builder: (context) {
                return FlatButton(
                  onPressed: () {
                    setState(() {
                      _decorationColor = _decorationColor == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedDecoratedBox toggle",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            )
          ].map((e){
            return Padding(padding: const EdgeInsets.symmetric(vertical: 16),child: e);
          }).toList(),
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget{
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _decoration = visitor(_decoration, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}