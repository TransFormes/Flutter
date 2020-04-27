import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './store/index.dart';
import './detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Store(),)
      ],
      child: MaterialApp(
        title: '标题',
        home: MainPage(),
        routes: {
          '/detail':(context)=> DetailPage()
        },
      ),
    );
  }
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('provider'),),
      body: FlatButton(
        onPressed: (){
          // Provider.of<Store>(context,listen: false).setNumber(4564654654);
          Provider.of<Store>(context,listen: false).setName('userId111111');
          Navigator.of(context).pushNamed('/detail');
        }, 
        child: Text('改变')
      ),
    );
  }
}