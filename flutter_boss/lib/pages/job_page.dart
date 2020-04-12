import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './../model/job.dart';
import './../common/util/request.dart';
import './../components/job_item.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> with AutomaticKeepAliveClientMixin{

  Future<List<Job>> _fetchJobList() async {
    List<Job> jobList = List<Job>();
    Response<Map<String, dynamic>> response = await Request().get('/jobs/list/1');
    if(response.statusCode == 200){
      Map<String, dynamic> result = response.data;
      for(dynamic value in result['data']['jobs']){
        Job job = Job.fromJson(value);
        jobList.add(job);
      }
    }
    return jobList;
  }

  @override
  bool get wantKeepAlive => true;
  
  Widget _createListView(BuildContext context, AsyncSnapshot snapshot){
    List<Job> jobList = snapshot.data;
    return ListView.builder(
      key: PageStorageKey('job-list'),
      itemCount: jobList.length,
      itemBuilder: (BuildContext context, int index){
        return JobItem(
          onPressed:(){},
          job: jobList[index]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("job",style: TextStyle(color:Colors.white,fontSize: 20),),
          elevation: 0,
          centerTitle: true,
        ),
      body: Center(
        child: FutureBuilder(
          future: _fetchJobList(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();                
              default:
                if(snapshot.hasError){
                  return Text("Error: ${snapshot.error}");
                }else{
                  return _createListView(context, snapshot);
                }
            }
          },
        )
      ),
    );
  }
}