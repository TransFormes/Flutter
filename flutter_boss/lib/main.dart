import 'package:flutter/material.dart';
import './layout_type.dart';
import './common/config/config.dart';
import './pages/chat_page.dart';
import './pages/company_page.dart';
import './pages/mine_page.dart';
import './pages/job_page.dart';
import './welcome.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() { 
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter boos",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryIconTheme: IconThemeData(color:Colors.white),
        brightness: Brightness.light,
        accentColor: Config.GLOBAL_COLOR
      ),
      home: WelCome(),
    );
  }
}
class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}):super(key:key);
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutType _layoutType = LayoutType.job;
  
  Color _colorTabMatching({LayoutType layoutSelection}){
    return _layoutType == layoutSelection ? Config.GLOBAL_COLOR : Colors.grey;
  } 
  BottomNavigationBarItem _buildItem(IconData icon, LayoutType layoutSelection){
    String text = layoutName(layoutSelection);
    return BottomNavigationBarItem(
      icon: Icon(icon, color: _colorTabMatching(layoutSelection: layoutSelection),),
      title: Text(text,style: TextStyle(color: _colorTabMatching(layoutSelection: layoutSelection)),)
    );
  }
  Widget _buildButtonNavBar(){
    return BottomNavigationBar(
      items: [
        _buildItem(Icons.home, LayoutType.job),
        _buildItem(Icons.computer, LayoutType.company),
        _buildItem(Icons.message, LayoutType.chat),
        _buildItem(Icons.accessibility_new, LayoutType.mine),
      ],
      onTap: _onSelectTap,
    );
  }
  void _onLayoutSelected(LayoutType type){
    setState(() {
      _layoutType = type;
    });
  }
  void _onSelectTap(int index){
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.job);
        break;
      case 1:
        _onLayoutSelected(LayoutType.company);
        break;
      case 2:
        _onLayoutSelected(LayoutType.chat);
        break;
      case 3:
        _onLayoutSelected(LayoutType.mine);
        break;
      default:
    }
  }
  Widget _buildBody(){
    LayoutType layoutType = _layoutType;
    switch (layoutType) {
      case LayoutType.job:
        return JobPage();
      case LayoutType.company:
        return CompanyPage();
      case LayoutType.chat:
        return ChatPage();
      case LayoutType.mine:
        return MinePage();
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(),
        bottomNavigationBar: _buildButtonNavBar(),
    );
  }
}