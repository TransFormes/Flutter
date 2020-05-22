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
      child: Consumer<Store>(
        builder: (context, name, _){
          return MaterialApp(
            title: '标题',
            home: MainPage(),
            localizationsDelegates: [

            ],
            routes: {
              '/detail':(context)=> DetailPage()
            },
          );
        },
      ),
      // child: MaterialApp(
      //   title: '标题',
      //   home: MainPage(),
      //   routes: {
      //     '/detail':(context)=> DetailPage()
      //   },
      // ),
    );
  }
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => Provider.of<Store>(context,listen: false).setName('userId111111'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('provider'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('dadasdas'),
          Text('1', textAlign: TextAlign.left,)
          // FlatButton(
          //   onPressed: (){
          //     // Provider.of<Store>(context,listen: false).setNumber(4564654654);
          //     Navigator.of(context).pushNamed('/detail');
          //   }, 
          //   child: Text(Provider.of<Store>(context, listen: false).name)
          // ),
        ],
      )
    );
  }
}