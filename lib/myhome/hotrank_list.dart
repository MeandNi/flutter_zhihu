import 'package:flutter/material.dart';
import 'package:flutter_zhihu/model/hotrankitem.dart';

class HotRankList extends StatefulWidget{

  @override
  HotRankListState createState() => new HotRankListState();
}

class HotRankListState extends State<HotRankList>{

  Widget hotCard(RankItem item) {
    return new Container(
      decoration: new BoxDecoration(
          color: Colors.white,
      ),
      child: new FlatButton(
          onPressed: (){
          },
          child: new Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                    flex: 1,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new Text(
                            item.order,
                            style: new TextStyle(
                                color: item.order.compareTo("03") <= 0 ? Colors.red : Colors.green,
                                fontSize: 18.0
                            )
                          ),
                          alignment: Alignment.topLeft,
                        )
                      ],
                    )
                ),
                new Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              item.title,
                              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 1.1, color: Colors.black),
                            ),
                            padding: const EdgeInsets.only(bottom: 10.0,right: 4.0),
                            alignment: Alignment.topLeft,
                          ),
                          item.mark != null ?
                            new Container(
                              child: new Text(item.mark, overflow: TextOverflow.ellipsis, style: new TextStyle(color: Colors.black)),
                              alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(bottom: 8.0,right: 4.0)
                            ) : new Container(),
                          new Container(
                            child: new Text(item.hotNum, style: new TextStyle(color: Colors.grey)),
                            alignment: Alignment.topLeft,
                          )
                        ],
                      ),
                    )
                ),
                new Expanded(
                    flex: 3,
                    child: Center(
                      child: new AspectRatio(
                          aspectRatio: 3.0 / 2.0,
                          child: new Container(
                            foregroundDecoration:new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage(item.imgUrl),
                                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                ),
                                borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                            ),
                          )
                      ),
                    )
                )
              ],
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 10.0,),
        hotCard(itemList[0]),
        hotCard(itemList[1]),
        hotCard(itemList[2]),
        hotCard(itemList[3]),
        hotCard(itemList[4]),
      ],
    );
  }
}