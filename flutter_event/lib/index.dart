import 'package:flutter/material.dart';
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<String> evenList = List<String>();
  @override
  void initState() {
    super.initState();
    evenList.add("Listener");
    evenList.add("PointerEvent");
    evenList.add("GestureDetector");
    evenList.add("Drag");
    evenList.add("Scale");
    evenList.add("GestureRecognizer");
    evenList.add("BothDirection");
    evenList.add("NotificationListener");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("weight"),
      ),
      body: ListView.builder(
        itemCount: evenList.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: GestureDetector(
              child: Text(evenList[index]),
              onTap: (){
                Navigator.pushNamed(context, "/${evenList[index]}");
              },
            ),
          );
        }
      ),
    );
  }
}