import 'package:flutter/material.dart';

class ScrollStatusPage extends StatefulWidget {
  @override
  _ScrollStatusPageState createState() => _ScrollStatusPageState();
}

class _ScrollStatusPageState extends State<ScrollStatusPage> {
  String message = "";
  _onStartScroll(ScrollMetrics metrics){
    setState(() {
      message = "srcoll Strat";
    });
  }
  _onUpdateScroll(ScrollMetrics metrics){
    setState(() {
      message = "scroll Update";
    });
  }
  _onEndScroll(ScrollMetrics metrics){
    setState(() {
      message = "scroll end";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationListener"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.green,
            child: Text(message),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification){
                if(scrollNotification is ScrollNotification ) {
                  return _onStartScroll(scrollNotification.metrics);
                }else if(scrollNotification is ScrollUpdateNotification){
                  return _onUpdateScroll(scrollNotification.metrics);
                }else if(scrollNotification is ScrollEndNotification){
                  return _onEndScroll(scrollNotification.metrics);
                }
                return false;
              },
              child: ListView.builder(
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text("Index: $index"),
                  );
                },
                itemCount: 30,
              )
            )
          )
        ],
      ),
    );
  }
}