import 'package:flutter/material.dart';
class CustomScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("test00"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment(0, 0),
              height: 100,
              color: Colors.yellow,
              child: Text("Container"),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 10
            ), 
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              childAspectRatio: 4,
              crossAxisSpacing: 10
            )
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
              );
            }), 
            itemExtent: 50
          )
        ],
      ),
    );
  }
}