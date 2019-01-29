import 'package:flutter/material.dart';
import 'package:flutter_zhihu/message/message_list.dart';
import 'package:flutter_zhihu/model/message.dart';
import 'package:flutter_zhihu/network/requst.dart';


class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  List<Message> modules = [];

  @override
  void initState() {
    fetchData();
  }

  Future<void> fetchData() async {

    var responseJson = await Request.get(action: "message");
    List<Message> modules = [];
    responseJson.forEach((data) {
      modules.add(Message.fromJson(data));
    });

    setState(() {
      this.modules = modules;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
        elevation: 0,
        actions: <Widget>[
          FlatButton(
            onPressed: null,
            child: Icon(Icons.add_alert, color: Colors.blue,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          child: ListView(
            children: <Widget>[

              MessageList(messages: modules,)
            ],
          ),
          onRefresh: fetchData,
        ),
      ),
    );
  }
}

