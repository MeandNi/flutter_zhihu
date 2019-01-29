import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu/model/idea.dart';
import 'package:flutter_zhihu/utils/screen.dart';

class IdeaList extends StatelessWidget {
  final List<Idea> ideas;

  const IdeaList({Key key, this.ideas}) : super(key: key);

  Widget buildModule(BuildContext context, Idea module) {
    return IdeaListItem(
      item: module,
    );
  }

  @override
  Widget build(BuildContext context) {
    var children = ideas
        .map((item) => IdeaListItem(
              item: item,
            ))
        .toList();

    return Column(
      children: children,
    );
  }
}

class IdeaListItem extends StatelessWidget {
  final Idea item;

  const IdeaListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: CachedNetworkImageProvider(item.author.avatar_url),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.author.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "12天前",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: Screen.width(context) * 0.8,
                  child: Text(
                    item.content,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Image(image: CachedNetworkImageProvider(item.imageurl)),
              ],
            ),
          )
        ]
      ),
    );
  }
}
