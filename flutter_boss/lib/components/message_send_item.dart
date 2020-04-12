import 'package:flutter/material.dart';
import './../model/message.dart';
class MessageItem extends StatelessWidget {
  final Message message;
  VoidCallback onPressed;
  MessageItem({Key key, this.message, this.onPressed}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom:10),
        padding: const EdgeInsets.only(left:18,top:10,right:18,bottom:10),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(message.head),
              radius: 32,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15,top: 3),
                    child: Text(message.name,style: TextStyle(color:Colors.black,fontSize:16),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:15,top:7),
                    child: Text(message.message,maxLines: 1,textScaleFactor: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontSize: 16),),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}