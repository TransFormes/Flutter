import 'package:flutter/material.dart';
import './page1.dart' as first;
import './page2.dart' as second;
import './page3.dart' as three;

void main(){
  runApp(MaterialApp(
    home: MyTaps(),
  ));
}
class MyTaps extends StatefulWidget {
  @override
  _MyTapsState createState() => _MyTapsState();
}

class _MyTapsState extends State<MyTaps> with SingleTickerProviderStateMixin{

  TabController constroll;

  @override
  void initState() {
    constroll = TabController(vsync: this,length: 3);
    super.initState();
  }
  @override
  void dispose() {
    constroll.dispose();    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pages"),
        backgroundColor: Colors.deepOrange,
        bottom: TabBar(
          controller: constroll,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.arrow_forward)
            ),
            Tab(
              icon: Icon(Icons.arrow_downward)
            ),
            Tab(
              icon: Icon(Icons.arrow_back)
            )
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.deepOrange,
        child: TabBar(
          controller: constroll,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.arrow_forward)
            ),
            Tab(
              icon: Icon(Icons.arrow_downward)
            ),
            Tab(
              icon: Icon(Icons.arrow_back)
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: constroll,
        children: <Widget>[
          first.Page1(),
          second.Page2(),
          three.Page3()
        ],
      ),
    );
  }
}