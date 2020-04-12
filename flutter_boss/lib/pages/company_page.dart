import 'package:flutter/material.dart';
import './../common/util/request.dart';
import 'package:dio/dio.dart';
import './../model/company.dart';
import './../components/company_item.dart';
import './../components/company_detail.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> with AutomaticKeepAliveClientMixin{
  

  Future<List<Company>> _getData() async{
    List<Company> companyList = List<Company>();
    Response<Map<String, dynamic>> response = await Request().get('/company/list/1');
    if(response.statusCode == 200){
      Map<String, dynamic> result = response.data;
      for (dynamic data in result['data']['companies']) {
        Company companyData = Company.fromJson(data);
        companyList.add(companyData);
      }
    }
    return companyList;
  }

  // Future<List<Company>> _getData() async {
  //   List<Company> companyList = List<Company>();
  //   Response<Map<String, dynamic>> response =
  //       await HttpUtil().get('/company/list/1');
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> result = response.data;
  //     for (dynamic data in result['data']['companies']) {
  //       Company companyData = Company.fromJson(data);
  //       companyList.add(companyData);
  //     }
  //   }
  //   return companyList;
  // }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '公 司',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: _getData(),
          builder:(BuildContext context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new CircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return _createListView(context, snapshot);
            }
          }
        )
      ),
    );
  }
  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Company> companyList = snapshot.data;
    return ListView.builder(
      key: new PageStorageKey('company-list'),
      itemCount: companyList.length,
      itemBuilder: (BuildContext context, int index) {
        return CompanyItem(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompanyDetailPage(
                    company: companyList[index], heroLogo: "heroLogo${index}"),
              ),
            );
          },
          company: companyList[index],
          heroLogo: "heroLogo${index}",
        );
      },
    );
  }
}