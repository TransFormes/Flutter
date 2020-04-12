import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './../common/util/request.dart';
import './../model/company.dart';
import './../model/company_detail.dart';
import './welfare_item.dart';
import './scroll_image_item.dart';
import './../pages/galler_page.dart';

class CompanyDetailPage extends StatefulWidget {
  final Company company;
  final String heroLogo;

  CompanyDetailPage({Key key, @required this.company, @required this.heroLogo})
      : super(key: key);
  @override
  _CompanyDetailPageState createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> with AutomaticKeepAliveClientMixin{
  
  ScrollController _scrollController;
  bool isShow = false;

  Future<CompanyDetail> _getData() async{
    Response<Map<String, dynamic>> response = await Request().get('/companyDetail/5d391d23b018ef73809438c7');
    if(response.statusCode == 200){
      CompanyDetail companyDetail = CompanyDetail.fromJson(response.data['data']['companyDetail']);
      return companyDetail;
    }
  }
  _scrollListener() {
    setState(() {
      if(_scrollController.offset <56 && isShow){
        isShow = false;
      } else if(_scrollController.offset >= 56 && !isShow){
        isShow = true;
      }
    });
  }
  @override
  void initState() { 
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
  }
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 68, 76, 96),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.company.logo),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop)
            )
          ),
          child: _companyDetailView(context),
        )
      ),
    );
  }
  Widget _companyDetailView(BuildContext context){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              pinned: true,
              backgroundColor: Color.fromARGB(isShow == true ? 255 : 0, 68, 76, 96),
              centerTitle: false,
              title: Text(
                widget.company.company,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(
                    isShow == true ? 255 : 0, 255, 255, 255),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search), 
                  onPressed: (){
                    print('搜索');
                  }
                )
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:20,left:25,bottom:10),
                              child: Text(
                                "${widget.company.company}",
                                style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 25.0,
                              ),
                              child: Text(
                                '${widget.company.info}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            )
                          ],
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                            right: 30.0,
                          ),
                          child: Hero(
                            tag: widget.heroLogo,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                widget.company.logo,
                                width: 70,
                                height: 70,
                              ),
                            ),
                          )),
                      ),
                    ],
                  ),
                  FutureBuilder<CompanyDetail>(
                    future: _getData(),
                    builder: (context, snapshot){
                      if (snapshot.hasData) {
                        return _companyBody(context, snapshot);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Center(child: CircularProgressIndicator());
                    }
                  )
                ]
              )
            )
          ],
        )
      ],
    );
  }
  
  Widget _companyBody(BuildContext context, AsyncSnapshot snapshot){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30.0, left: 25.0, right: 20.0),
          child: _createWorkHours()),
        _createWelfareItem(),
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
          child: Text(
            "公司介绍",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 10.0, right: 25.0),
          child: Text(
            snapshot.data.inc,
            textAlign: TextAlign.justify,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.0,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 25.0, bottom: 10.0),
          child: Text(
            "公司照片",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(left: 20.0, top: 20.0, right: 0.0, bottom: 50.0),
          height: 120.0,
          child: _createImgList(context, snapshot),
        )
      ],
    );
  }
  Widget _createWorkHours(){
    return Wrap(
      spacing: 40,
      runSpacing: 16,
      direction: Axis.horizontal,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
            ),
            Text(
              '下午1:00-下午10:00',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
            ),
            Text(
              '大小周',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.movie,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
            ),
            Text(
              '偶尔加班',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        )
      ],
    );
  }

  Widget _createWelfareItem(){
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 10.0,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20.0, top: 0.0, right: 0.0, bottom: 20.0),
        height: 120.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            WelfareItem(iconData: Icons.flip, title: "五险一金"),
            WelfareItem(iconData: Icons.security, title: "补充医疗\n保险"),
            WelfareItem(iconData: Icons.access_alarm, title: "定期体检"),
            WelfareItem(iconData: Icons.face, title: "年终奖"),
            WelfareItem(iconData: Icons.brightness_5, title: "带薪年假"),
          ],
        ),
      ),
    );
  }
  Widget _createImgList(BuildContext context, AsyncSnapshot snapshot) {
    List imgList = snapshot.data.companyImgsResult;
    return ListView.builder(
      itemCount: imgList.length,
      key: PageStorageKey('img-list'),
      itemBuilder: (BuildContext context, int index){
        return ScrollImageItem(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder<Null>(
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: GalleryPage(
                            url: imgList[index], heroTag: 'heroTag${index}'),
                      );
                    },
                  );
                },
                transitionDuration: Duration(milliseconds: 300),
              ),
            );
          },
          url: imgList[index],
          heroTag: 'heroTag${index}',
        );
      }
    );
  }
}