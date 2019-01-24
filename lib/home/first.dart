import 'package:flutter/material.dart';

class FirstItem extends StatefulWidget {
  final String title;
  FirstItem(this.title);

  _FirstItemState createState() => _FirstItemState();
}

class _FirstItemState extends State<FirstItem> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}