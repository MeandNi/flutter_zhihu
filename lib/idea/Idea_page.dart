import 'package:flutter/material.dart';
import 'package:flutter_zhihu/idea/idea_header.dart';
import 'package:flutter_zhihu/model/idea.dart';
import 'package:flutter_zhihu/model/topic.dart';
import 'package:flutter_zhihu/network/requst.dart';
import 'package:flutter_zhihu/utils/screen.dart';

class IdeaPage extends StatefulWidget {
  @override
  _IdeaPageState createState() => _IdeaPageState();
}

class _IdeaPageState extends State<IdeaPage> {
  double navAlpha = 0;
  ScrollController scrollController = ScrollController();

  List<Topic> topics = [];
  List<Idea> ideas = [];

  @override
  void initState() {
    fetchData();
    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  Future<void> fetchData() async {

    var topicJson = await Request.get(action: 'idea_topic');

    List<Topic> topics = [];
    topicJson.forEach((data) {
      topics.add(Topic.fromJson(data));
    });

    setState(() {
      this.topics = topics;
    });
  }

  Widget buildActions(Color iconColor) {
    return Row(children: <Widget>[]);
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          child: Container(
            margin:
                EdgeInsets.fromLTRB(5, Screen.statusBarHeight(context), 0, 0),
            child: buildActions(Colors.white),
          ),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            padding:
                EdgeInsets.fromLTRB(5, Screen.statusBarHeight(context), 0, 0),
            height: Screen.navigationBarHeight(context),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '想法',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                buildActions(Colors.black38),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          RefreshIndicator(
            child: ListView(
              controller: scrollController,
              children: <Widget>[
                IdeaHeader(topics: topics,),
              ],
            ),
            onRefresh: () {},
          ),
          buildNavigationBar(),
        ]),
      ),
    );
  }
}
