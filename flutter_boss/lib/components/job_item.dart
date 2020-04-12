import 'package:flutter/material.dart';
import './../common/config/config.dart';
import './../model/job.dart';

class JobItem extends StatelessWidget {
  JobItem({Key key, this.job, this.onPressed}):super(key:key);
  final Job job;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(left: 18,top: 10,right: 18,bottom: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(job.title,style: TextStyle(color:Colors.black,fontSize: 16),)
                ),
                Text(job.salary,style:TextStyle(color: Config.GLOBAL_COLOR,fontSize: 18))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(job.company),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F8),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              padding: const EdgeInsets.only(top:12,bottom:8),
              child: Text(job.info,style: TextStyle(color: Color(0xFF9fa3b0)),),
            ),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(job.head),
                  radius: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(job.publish),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}