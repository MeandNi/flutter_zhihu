import 'package:flutter/material.dart';

class IdeaPage extends StatefulWidget {
  @override
  _IdeaPageState createState() => _IdeaPageState();
}

class _IdeaPageState extends State<IdeaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Idea"),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Text("sss"),
          Text("sss"),
          Text("sss"),
          Text("sss"),
        ],
      ),
    );
  }
}
