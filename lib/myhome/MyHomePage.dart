import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final loginButton = RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    onPressed: () {},
//    padding: EdgeInsets.all(12),
    color: Colors.grey,
    child: Text('Log In', style: TextStyle(color: Colors.white)),
  );

  Widget barSearch() {
    return new Container(
//      padding: EdgeInsets.all(10.0),
      child: new Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
//              padding: EdgeInsets.all(10.0),
              child: new FlatButton.icon(
                onPressed: () {},
                icon: new Icon(
                  Icons.search,
                  size: 20.0,
                  color: Colors.grey,
                ),
                label: new Text(
                  "搜索学院资产",
                  style: new TextStyle(color: Colors.grey, fontSize: 18.0),
                ),
              ),
              decoration: new BoxDecoration(
                borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                color: Colors.black12,
              ),
            ),
          ),
          loginButton
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: barSearch(),
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
