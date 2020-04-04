import 'package:flutter/material.dart';
// class MainPage extends StatelessWidget {
//   final List<String> list = [];
//   @override
//   void initState() {
//     super.initState();
//     list.add("curved");
//     list.add("Tween");
//     list.add("Loading");
//     list.add("fade");
//     list.add("AnimatedBuilder");
//     list.add("Hero");
//     list.add("StaggerAnimation");
//     list.add("AnimatedSwitcher");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("动画演示")),
//       body: ListView.builder(
//         itemCount: list.length,
//         itemBuilder: (BuildContext context,int index){
//           return ListTile(
//             title: GestureDetector(
//               child: Text(list[index]),
//               onTap: (){
//                 Navigator.pushNamed(context, "/${list[index]}");
//               },
//             ),
//           );
//         }
//       ),
//     );
//   }
// }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> list = [
  ];
  @override
  void initState() {
    super.initState();
    list.add("curved");
    list.add("Tween");
    list.add("Loading");
    list.add("fade");
    list.add("AnimatedBuilder");
    list.add("Hero");
    list.add("StaggerAnimation");
    list.add("AnimatedSwitcher");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("动画演示")),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            title: GestureDetector(
              child: Text(list[index]),
              onTap: (){
                Navigator.pushNamed(context, "/${list[index]}");
              },
            ),
          );
        }
      ),
    );
  }
}