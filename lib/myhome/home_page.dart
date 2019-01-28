import 'package:flutter/material.dart';
import 'package:flutter_zhihu/myhome/myhome_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  void dispose() {
    ///页面销毁时，销毁控制器
    _tabController.dispose();
    super.dispose();
  }

  final loginButton = FlatButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.mode_edit,
        size: 20.0,
        color: Colors.blue,
      ),
      label: Text(
        "提问",
        style: TextStyle(color: Colors.blue, fontSize: 18.0),
      ));

  Widget barSearch() {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new FlatButton.icon(
              color: Colors.black12,
              onPressed: () {},
              icon: new Icon(
                Icons.search,
                size: 18.0,
                color: Colors.grey,
              ),
              label: new Text(
                "搜索",
                style: new TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
          ),
        ),
        loginButton
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: barSearch(),
        elevation: 0,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: <Widget>[
            new Tab(text: "关注"),
            new Tab(text: "推荐"),
            new Tab(text: "热情"),
            new Tab(text: "视频"),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          MyHomeListView(),
          MyHomeListView(),
          MyHomeListView(),
          MyHomeListView(),
        ],
      ),
    );
  }
}
