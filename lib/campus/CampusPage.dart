import 'package:flutter/material.dart';

class CompusPage extends StatefulWidget {
  @override
  _CompusPageState createState() => _CompusPageState();
}

class _CompusPageState extends State<CompusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campus"),
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
