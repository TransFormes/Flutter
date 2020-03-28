import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './indexPage/nanTong.dart';
import './indexPage/nanZhuang.dart';
import './indexPage/nvTong.dart';
import './indexPage/nvZhuang.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  final List<Widget> indexPageItem= [
    Nvzhuang(),
    NvTong(),
    NanZhuang(),
    NanTong()
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: indexPageItem.length, vsync: this);
    _tabController.addListener(() {

     });
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: TabBar(
          labelPadding: EdgeInsets.symmetric(vertical: 10),
          controller: _tabController,
          labelColor: Colors.white,
          tabs: <Widget>[
            Text("女装"),
            Text("女童"),
            Text("男装"),
            Text("男童"),
          ],
          onTap: (int index){
            print(index);
          },
          dragStartBehavior: DragStartBehavior.start,
        ),
        // body: Center(
        //   child: Text("da"),
        // ),
        body: TabBarView(
          controller: _tabController,
          children: indexPageItem
        )
      )
    );
  }
}