import 'package:flutter/material.dart';
import 'package:flutter_zhihu/component/cell/me_cell.dart';
import 'package:flutter_zhihu/me/setting_page.dart';
import 'package:flutter_zhihu/me/me_header.dart';
import 'package:flutter_zhihu/utils/app_navigator.dart';

class MePage extends StatelessWidget {
  Widget buildCells(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MeCell(
            title: '列表1',
            icon: Icons.access_alarm,
            onPressed: () {},
          ),
          MeCell(
            title: '列表2',
            icon: Icons.message,
            onPressed: () {},
          ),
          MeCell(
            title: '列表3',
            icon: Icons.ac_unit,
            onPressed: () {},
          ),
          MeCell(
            title: '列表4',
            icon: Icons.add_photo_alternate,
            onPressed: () {},
          ),
          MeCell(
            title: '更多服务',
            icon: Icons.more,
            onPressed: () {},
          ),
          SizedBox(height: 24.0),
          MeCell(
            title: '设置',
            icon: Icons.confirmation_number,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingPage();
              }));
            },
          ),
          MeCell(
            title: 'GitHub',
            icon: Icons.person,
            onPressed: () {
              AppNavigator.pushWeb(
                  context, 'https://github.com/Meandni', 'Github');
            },
          ),
        ],
      ),
    );
  }

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
                "搜索知乎内容",
                style: new TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.crop_free,
            color: Colors.grey,
            size: 32.0,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: barSearch(),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0,),
            MeHeader(),
            SizedBox(height: 10),
            buildCells(context),
          ],
        ),
      ),
    );
  }
}
