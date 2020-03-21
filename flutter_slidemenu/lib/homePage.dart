import 'package:flutter/material.dart';
import './otherPage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainProfilePicture = "https://desk-fd.zol-img.com.cn/t_s144x90c5/g5/M00/02/07/ChMkJlbKy5GIKHO3AAXx0E0tcL8AALIsgMfpwoABfHo739.jpg";
  String otherProfilePicture = "https://desk-fd.zol-img.com.cn/t_s144x90c5/g5/M00/01/0D/ChMkJ1uYaZ-IKDkFAAR_I31LhRMAAroYwNnOnQABH87217.jpg";

  void swtchUser(){
    String defaultString = mainProfilePicture;
    this.setState(() { 
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = defaultString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("drawer")),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("flutter开发者"), 
              accountEmail: Text("123456798"),
              currentAccountPicture: GestureDetector(
                onTap: () => print("点击事件"),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(mainProfilePicture),
                ),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () => swtchUser(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(otherProfilePicture),
                  ),
                )
              ],
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://desk-fd.zol-img.com.cn/t_s208x130c5/g4/M00/0F/02/Cg-4zFT5Wj-IQxAKABhgu3KD_twAAWK_ANBmYUAGGDT047.jpg")
                )
              ),
            ),
            ListTile(
              title: Text("常用组件"),
              trailing: Icon(Icons.arrow_upward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context) => OtherPage("常用组件")));
              },
            ),
            Divider(),
            ListTile(
              title: Text("关闭"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: Center(
        child: Text("honePage",style:TextStyle(fontSize: 35)),
      ),
    );
  }
}