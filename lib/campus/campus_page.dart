import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu/myhome/myhome_list.dart';

class CompusPage extends StatefulWidget {
  @override
  _CompusPageState createState() => _CompusPageState();
}

class _CompusPageState extends State<CompusPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  void dispose() {
    ///页面销毁时，销毁控制器
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Meandni",
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ),
            Text(
              "Campus",
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ],
        ),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25.0,
            backgroundImage: CachedNetworkImageProvider(
                "https://meandni.com/img/avatar.jpg"),
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_frames,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          )
        ],
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: <Widget>[
            new Tab(text: "课堂"),
            new Tab(text: "读书会"),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          MyHomeListView(),
          MyHomeListView(),
        ],
      ),
    );
  }
}
