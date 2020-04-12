import 'package:flutter/material.dart';
import './../model/message.dart';
import 'package:dio/dio.dart';
import './../common/util/request.dart';
import './../components/message_item.dart';
import './../components/message_history.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin{
  Future<List<Message>> _fetchMessageList() async {
    List<Message> messageList = List<Message>();
    Response<Map<String, dynamic>> response =
        await Request().get('/messages/find');
    if (response.statusCode == 200) {
      Map<String, dynamic> result = response.data;
      for (dynamic data in result['data']['messages']) {
        Message messageData = Message.fromJson(data);
        messageList.add(messageData);
      }
    }
    return messageList;
  }
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息",style: TextStyle(color:Colors.white,fontSize: 20),),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: _fetchMessageList(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
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
    List<Message> messageList = snapshot.data;
    return ListView.builder(
      key: new PageStorageKey('message-list'),
      itemCount: messageList.length,
      itemBuilder: (BuildContext context, int index) {
        return new MessageItem(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MessageHistoryPage(message: messageList[index]),
                ),
              );
            },
            message: messageList[index]);
      },
    );
  }
}