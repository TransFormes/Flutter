import 'package:flutter/material.dart';
import './../model/message.dart';

class MessageReceiveItem extends StatelessWidget {
  final Message message;
  VoidCallback onPressed;
  MessageReceiveItem({Key key, this.message, this.onPressed}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.only(
            left: 18.0, top: 10.0, right: 18.0, bottom: 10.0),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(message.head),
              radius: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: LimitedBox(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(100, 211, 211, 211)
                      ),
                      child: Text(message.message,style: TextStyle(color:Colors.black,fontSize:16),),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}