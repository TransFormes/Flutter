import 'package:flutter/material.dart';
import './routes/camera.dart';
import './routes/align.dart';
import './routes/animated_switcher_counter.dart';
import './routes/animated_widget.dart';
import './routes/animated_switcher.dart';
import './routes/buttom.dart';
import './routes/clip.dart';
import './routes/color.dart';
import './routes/context.dart';
import './routes/custom_print.dart';
import './routes/decoratedBoxPage.dart';
import './routes/dialog.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      title: "flutter widget",
      routes: {
        '/camera': (context) => CameraExampleHome(),
        '/align': (context) => AlignPage(),
        '/animatedSwitcher': (context) => AnimatedSwitcherCounerPage(),
        '/animatedWidget': (context) => AnimatedWidgetPage(),
        '/animatedSwitcher': (context) => AnimatedSwitcherPage(),
        '/buttom': (context) => ButtomPage(),
        '/clip': (context) => ClipPage(),
        '/color': (context) => ColorPage(),
        '/context': (context) => ContextPage(),
        '/customPainter': (context) => CustomPainterPage(),
        '/decoratedBox': (context) => DecoratedBxoPage(),
        '/dialog': (context) => DiaLogPage(),
      },
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List page = [
    'camera', 
    'align', 
    'animatedSwitcher', 
    'animatedWidget', 
    'animatedSwitcher',
    'buttom',
    'clip',
    'color',
    'context',
    'customPainter',
    'decoratedBox',
    'dialog'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('widget')),
      body: ListView.builder(
        itemCount: page.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(page[index]),
            onTap: (){
              Navigator.pushNamed(context, '/${page[index]}');
            },
          );
        },
      ),
    );
  }
}