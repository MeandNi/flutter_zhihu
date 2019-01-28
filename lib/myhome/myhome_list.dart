import 'package:flutter/material.dart';
import 'package:flutter_zhihu/model/recommend.dart';
import 'package:flutter_zhihu/myhome/recommend_item.dart';
import 'package:flutter_zhihu/network/requst.dart';

class MyHomeListView extends StatefulWidget {
  @override
  _MyHomeListViewState createState() => _MyHomeListViewState();
}

class _MyHomeListViewState extends State<MyHomeListView> {

  List<Recommend> modules = [];

  Future<void> fetchData() async {

    var responseJson = await Request.get(action: "myhome_recommend");
    List<Recommend> modules = [];
    responseJson.forEach((data) {
      modules.add(Recommend.fromJson(data));
    });

    setState(() {
      this.modules = modules;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Widget buildModule(BuildContext context, Recommend module) {

    return RecommendListItem(
      recommend: module,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fetchData,
      child: ListView.builder(
        itemCount: modules.length,
        itemBuilder: (BuildContext context, int index) {
          return buildModule(context, modules[index]);
        },
      ),
    );
  }
}
