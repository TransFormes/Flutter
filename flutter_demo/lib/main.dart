import 'package:flutter/material.dart';
import './bask/index.dart';
import './box/index.dart';
import './index/index.dart';
import './my/index.dart';
import './shop/index.dart';
import 'package:provide/provide.dart';
import './provider/index.dart';
import './config/routes.dart';


void main(){
  var store = Store();
  var providers = Providers(); 
  providers..provide(Provider<Store>.value(store));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "选服",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive =>true;

  int currentPageIndex = 0;
  var currentPage;
  final List<Widget> pageList = [
    IndexPage(),
    BoxPage(),
    ShopPage(),
    BaskPage(),
    MyPage()
  ];
  final List<BottomNavigationBarItem> tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("首页")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_box),
      title: Text("衣盒")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shop),
      title: Text("")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_call),
      title: Text("晒衣晒")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.my_location),
      title: Text("我的")
    ),
  ];
  @override
  void initState() {
    super.initState();
    currentPage = pageList[currentPageIndex];
  }

  void _changePage(int index){
    currentPageIndex = index;
    print(currentPageIndex);
    setState(() {
      currentPage = pageList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(200, 19, 208, 102),
      bottomNavigationBar: BottomAppBar(
        // (currentPageIndex == 2 || currentPageIndex == 4) ? Colors.white : 
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              highlightColor: Colors.transparent,
              radius: 0,
              child: Text("首页",style: TextStyle(fontSize:18,color: currentPageIndex == 0 ? Colors.blue : Colors.white)),
              onTap: (){
                _changePage(0);
              },
            ),
            InkWell(
              highlightColor: Colors.transparent,
              radius: 0,
              child:Text("衣盒",style: TextStyle(fontSize:18,color: currentPageIndex == 1 ? Colors.blue : Colors.white)),
              onTap: (){
                _changePage(1);
              }
            ),
            InkWell(
              highlightColor: Colors.transparent,
              radius: 0,
              child: Image.network("https://www.baidu.com/img/baidu_jgylogo3.gif",width: 40,),
              onTap: (){
                _changePage(2);
              },
            ),
            InkWell(
              highlightColor: Colors.transparent,
              radius: 0,
              child: Text("晒衣晒",style: TextStyle(fontSize:18,color: currentPageIndex == 3 ? Colors.blue : Colors.white)),
              onTap: (){
                _changePage(3);
              }
            ),
            InkWell(
              highlightColor: Colors.transparent,
              radius: 0,
              child: Text("我的",style: TextStyle(fontSize:18,color: currentPageIndex == 4 ? Colors.blue : Colors.white)),
              onTap: (){
                _changePage(4);
              }
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: pageList,
      )
    );
  }
}