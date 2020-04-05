import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  int count = 0;
  @override
  void initState() { 
    super.initState();
    _getCount();
  }
  _getCount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      count = prefs.get("counter") ?? 0;
    });
  }
  void _incrementCouner() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int couner = (prefs.getInt("counter") ?? 0) + 1;
    setState(() {
      count = couner;
    });
    await prefs.setInt("counter", couner);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SharedPreferences")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点击数：' + count.toString(),
              style: Theme.of(context).textTheme.display1,),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCouner,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}