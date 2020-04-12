import 'dart:convert';
import 'package:flutter/material.dart';
import './../common/config/config.dart';
import './../model/message.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import './message_item.dart';
import './message_receive_item.dart';

class MessageHistoryPage extends StatefulWidget {
  final Message message;
  MessageHistoryPage({Key key, this.message}):super(key:key);
  @override
  _MessageHistoryPageState createState() => _MessageHistoryPageState();
}

class _MessageHistoryPageState extends State<MessageHistoryPage> {
  TextEditingController _controller = TextEditingController();
  WebSocketChannel channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  List<Message> _list = List();
  @override
  void initState() { 
    super.initState();
    channel.stream.listen((event) {
      Message msg = Message.fromJson(jsonDecode(event));
      msg.type = 'receive';
      setState(() {
        _list.add(msg);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.message.name,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index) {
                  return _makeMessageElement(index);
                } 
              )
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        autofocus: true,
                        decoration: new InputDecoration(
                          hintText: '发送一条消息',
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Config.GLOBAL_COLOR,
                      child: Text(
                        '发送',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: _sendMessage,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _sendMessage(){
    if(_controller.text.isNotEmpty){
      final Message msg = Message()
        ..name = widget.message.name
        ..head = widget.message.head
        ..message = _controller.text
        ..type = 'send';
      setState(() {
        _list.add(msg);
        channel.sink.add(jsonEncode(msg.toJson()));
      });
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    channel.sink.close();
  }

  Widget _makeMessageElement(index) {
    if (index >= _list.length) {
      return null;
    }
    Message msg = _list[index];
    if (msg.type == 'send') {
      return MessageItem(message: msg);
    } else if (msg.type == 'receive') {
      return MessageReceiveItem(message: msg);
    }
  }
}
