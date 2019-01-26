import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        RecommendListItem(
          title: "你见过最渣的渣女有多渣？",
          content: "你见过最渣的渣女有多渣你见过最渣的渣女有多渣的渣女过最渣的渣女有多渣你见过最渣的渣女有多渣....",
          username: "匿名用户",
          viewcount: "123",
          replaycount: "123",
        )
      ],
    );
  }
}

class RecommendListItem extends StatelessWidget {
  final String title;
  final String content;
  final String username;
  final String headicon;

  final String viewcount;
  final String replaycount;

  const RecommendListItem(
      {Key key,
      this.title,
      this.content,
      this.username,
      this.headicon,
      this.viewcount,
      this.replaycount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.person,
                size: 16.0,
              ),
              Text(
                username,
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            this.content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.view_array,
                semanticLabel: this.viewcount,
              ),
              Icon(
                Icons.repeat_one,
                semanticLabel: this.replaycount,
              )
            ],
          )
        ],
      ),
    );
  }
}
