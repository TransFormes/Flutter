import 'package:flutter/material.dart';
import 'package:flutter_lifecycle_state/flutter_lifecycle_state.dart';
import './second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lime
      ),
      title: "我是标题",
      home: MainPage(title: "传下去的标题"),
      navigatorObservers: [routeObserver],
    );
  }
}
class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}):super(key: key);
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _count = 0;
  @override
  void initState() {
    print("页面初始化");
    super.initState();
  }
  void _incrementCount(){
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next), 
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
            }
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("我是内容"),
            Text("$_count"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCount,
        tooltip: "长按提示",
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    print("页面销毁");
    super.dispose();
  }
  @override
  void reassemble() {
    print("页面热更新");
    super.reassemble();
  }
  @override
  void didChangeDependencies() {
    print("更新组件");
    super.didChangeDependencies();
  }
  @override
  void deactivate() {
    print("页面销毁之前执行");
    super.deactivate();
  }
  @override
  void didUpdateWidget(MainPage oldWidget) {
    print("组件更新");
    super.didUpdateWidget(oldWidget);
  }
}