import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Me"),
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
