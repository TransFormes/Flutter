import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './store/index.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(title:Text('详情页面')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('${store.name}'),
            Text('${store.count}')
          ],
        )
      ),
    );
  }
}