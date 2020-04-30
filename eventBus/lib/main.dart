import 'package:flutter/material.dart';
import './event.dart';
import './second.dart';
import './index.dart';
import './three.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
  void tabChange(int index){
    eventBus.emit('eventName', index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: tabController,
        labelColor: Colors.black,
        labelPadding: const EdgeInsets.symmetric(vertical: 20),
        tabs: [
          Text('页面1'),
          Text('页面2'),
          Text('页面3'),
        ],
        onTap: tabChange,
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Index(),
          Second(),
          Three(),
        ],
      ),
    );
  }
}