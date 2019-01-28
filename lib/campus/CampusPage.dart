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
          Row(
            children: <Widget>[
              Container(
                width: 90,
                  child: Text(
                      "sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
                    overflow: TextOverflow.ellipsis,
                  )
              ),
            ],
          ),
          Text("sss"),
          Text("sss"),
          Text("sss"),
        ],
      ),
    );
  }
}
