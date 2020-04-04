import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("das"),
          StreamBuilder<int>(
            stream: _streamController.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              return Text("${snapshot.data}",style: Theme.of(context).textTheme.bodyText1,);
            }
          ),
          Text('$_counter',style: Theme.of(context).textTheme.display1,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _streamController.sink.add(++_counter);
        },
        tooltip: "长按",
        child: Icon(Icons.add),
      ),
    );
  }
}