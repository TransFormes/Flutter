import 'package:flutter/material.dart';
import './../login/index.dart';
import 'package:provide/provide.dart';
import './../provider/index.dart';
class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int count = 0;
  void _addCount(){
    setState(() {
     count++; 
    });
  }
  Future<int> _selectType(){
    return showModalBottomSheet(
      context: context, 
      builder: (BuildContext context){
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (content, index){
            return ListTile(
              title: Text("$index"),
              onTap: (){
                print("$index");
                Navigator.of(context).pop();
              },
            );
          }
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("我占比1")
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 3,
                  child: Text("我是占比3"),
                )
              ],
            ),
            Container(
              height: 100,
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: 20,
                    width: 400,
                    child: Container(
                      color: Colors.green,
                      child: Text("左边"),
                    )
                  ),
                  Positioned(
                    right: 0,
                    top: 20,
                    child: Container(
                      color: Colors.green,
                      child: Text("右边"),
                    )
                  )
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.red
                  ]
                )
              ),
            ),
            CircularProgressIndicator(),
            Text("$count"),
            FloatingActionButton(
              onPressed: _addCount,
              child: Text("增加"),
            ),
            FlatButton(
              onPressed: (){
                Provide.value<Store>(context).setValue("userId", "dasdad");
              }, 
              child: Text("设置用户id")
            ),
            Text("用户id:${Store().userId}"),
            FlatButton(
              onPressed: (){
                var date = DateTime.now();
                return showDatePicker(
                  context: context, 
                  initialDate: date, 
                  firstDate: date, 
                  lastDate: date.add(Duration(days: 30)),
                  
                );
              }
            , child: Text("打开日历")
            ),
            FlatButton(
              onPressed: _selectType, 
              child: Text("选择类型")
            ),
            Text("${Store().userId}"),
            FloatingActionButton(
              heroTag: "登录",
              child: Text("登录"),
              onPressed: (){
                Navigator.pushNamed(context, "/login");
                // Navigator.of(context).pushNamed("/login");
                // Navigator.push(
                //   context, 
                //   MaterialPageRoute(builder: (BuildContext context){
                //     return LoginPage();
                //   })
                // );
              },
            )
          ],
        )
      ),
    );
  }
}