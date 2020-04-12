import 'package:flutter/material.dart';
import './../components/contact_item.dart';
import './../components/menu_item.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin{
  
  @override
  bool get wantKeepAlive => true;
  
  final double _appBarHeight = 180;
  final String _userHead = 'https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[
                          const Color(0x00000000),
                          const Color(0x00000000)
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 30.0,
                                bottom: 15.0,
                              ),
                              child: Text(
                                'kimi he',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30.0,
                              ),
                              child: Text(
                                '在职-不考虑机会',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            right: 30.0,
                          ),
                          child: CircleAvatar(
                            radius: 35.0,
                            backgroundImage: NetworkImage(_userHead),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ContactItem(
                          count: '696',
                          title: '沟通过',
                        ),
                        ContactItem(
                          count: '0',
                          title: '面试',
                        ),
                        ContactItem(
                          count: '71',
                          title: '已投递',
                        ),
                        ContactItem(
                          count: '53',
                          title: '感兴趣',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      MenuItem(
                        icon: Icons.face,
                        title: '体验新版本',
                      ),
                      MenuItem(
                        icon: Icons.print,
                        title: '我的微简历',
                      ),
                      MenuItem(
                        icon: Icons.archive,
                        title: '附件简历',
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: '管理求职意向',
                      ),
                      MenuItem(
                        icon: Icons.title,
                        title: '提升简历排名',
                      ),
                      MenuItem(
                        icon: Icons.chat,
                        title: '牛人问答',
                      ),
                      MenuItem(
                        icon: Icons.assessment,
                        title: '关注公司',
                      ),
                      MenuItem(
                        icon: Icons.add_shopping_cart,
                        title: '钱包',
                      ),
                      MenuItem(
                        icon: Icons.security,
                        title: '隐私设置',
                      ),
                    ],
                  ),
                )
              ]
            )
          )
        ],
      ),
    );
  }
}