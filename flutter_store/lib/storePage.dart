import 'package:flutter/material.dart';
class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<String> eventList = [];
  @override
  void initState() { 
    super.initState();
    eventList.add("SharedPreferences");
    eventList.add("CheckInPage");
    eventList.add("FileProvider");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("持久化")),
      body: ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(eventList[index]),
            onTap: (){
              Navigator.pushNamed(context, "/${eventList[index]}");
            },
          );
        }
      ),
    );
  }
}