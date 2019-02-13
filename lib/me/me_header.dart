import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:homeapp/public.dart';

class MeHeader extends StatelessWidget {

  Widget info = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(6.0))
    ),
    child: new FlatButton(
        onPressed: (){},
        child: new Container(
          child: new ListTile(
            leading: new Container(
              child: new CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                      "https://meandni.com/img/avatar.jpg"),
                  radius: 20.0
              ),
            ),
            title: new Container(
              margin: const EdgeInsets.only(bottom: 2.0),
              child: new Text("MeandNi"),
            ),
            subtitle: new Container(
              margin: const EdgeInsets.only(top: 2.0),
              child: new Text("查看或编辑个人主页"),
            ),
          ),
        )
    ),
  );

  Widget data = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(6.0))
    ),
    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: Row(
      children: <Widget>[
        PersonDataItem(itemName: "我的创作", itemData: "101"),
        PersonDataItem(itemName: "关注", itemData: "1"),
        PersonDataItem(itemName: "收藏夹", itemData: "21"),
        PersonDataItem(itemName: "最近浏览", itemData: "10"),
      ],
    )
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        info,
        data
      ],
    );
  }

}

class PersonDataItem extends StatelessWidget {

  final String itemName;
  final String itemData;

  const PersonDataItem({Key key, this.itemName, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: (MediaQuery.of(context).size.width - 6.0) / 4,
      child: new FlatButton(
          onPressed: (){},
          child: new Container(
            height: 50.0,
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new Text(itemData, style: new TextStyle(fontSize: 16.0, color: Colors.black),),
                ),
                new Container(
                  child: new Text(itemName, style: new TextStyle(fontSize: 12.0, color: Colors.black),),
                )
              ],
            ),
          )
      ),
    );
  }
}
