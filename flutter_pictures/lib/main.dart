import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "图片浏览器",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: PicturesPage(title: "图片浏览器"),
    );
  }
}
class PicturesPage extends StatefulWidget {
  PicturesPage({Key key,this.title}):super(key: key);
  final String title;
  @override
  _PicturesPageState createState() => _PicturesPageState();
}

class TopHeader extends SliverPersistentHeaderDelegate{
  double minExtent;
  double maxExtent;
  TopHeader({
    this.minExtent,
    this.maxExtent
  });
  @override
  Widget build(BuildContext context, double shrinkoffset, bool overlapsContent){
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset( 'assets/ronnie-mayo-361348-unsplash.jpg',fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated
            )
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: Text("我的相册",style:TextStyle(fontSize: 28,color: Colors.white)),
        )
      ],
    );
  }
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldOffset){
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class _PicturesPageState extends State<PicturesPage> {
  final int rowCount = 3;
  final List<String> list = [
    'assets/brady-bellini-212790-unsplash.jpg',
    'assets/stefan-stefancik-105587-unsplash.jpg',
    'assets/simon-fitall-530083-unsplash.jpg',
    'assets/anton-repponen-99530-unsplash.jpg',
    'assets/kevin-cochran-524957-unsplash.jpg',
    'assets/samsommer-72299-unsplash.jpg',
    'assets/simon-matzinger-320332-unsplash.jpg',
    'assets/meng-ji-102492-unsplash.jpg',
  ];
  Widget _scrollView(BuildContext context){
    return Container(
      // 滚动区域
      child: CustomScrollView(
        slivers: <Widget>[
          // 顶部吸顶组件
          SliverPersistentHeader(
            delegate: TopHeader(minExtent: 100,maxExtent: 200),
            pinned: true,
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 2.0, left: 2.0, right: 2.0, bottom: 2.0),
                  child: Image.asset(
                    list[index % list.length],
                  ),
                );
              },
              childCount: list.length * 3,    // 多放几张图片，让图片看上去比较多
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / rowCount,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 0.75
            )
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _scrollView(context),
    );
  }
}