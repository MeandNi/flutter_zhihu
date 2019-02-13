import 'package:flutter/material.dart';
import 'package:flutter_zhihu/utils/screen.dart';
import 'dart:math' as math;

class MeCell extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;

  MeCell({this.title, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width(context) - 15 * 2 - 15 * 3) / 4;
    var colors = [Colors.green, Colors.blue, Colors.lightBlueAccent, Colors.black54, Colors.redAccent];
    var random = new math.Random();

    return new Container(
      width: MediaQuery.of(context).size.width / 4,
      child: new FlatButton(
          onPressed: onPressed,
          child: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: new CircleAvatar(

                    radius: 18.0,
                    child: new Icon(icon, color: Colors.white),
                    backgroundColor: colors[random.nextInt(4)],
                  ),
                ),
                SizedBox(height: 8.0,),
                new Container(
                  child: new Text(title, style: new TextStyle(color: Colors.black87, fontSize: 14.0),),
                )
              ],
            ),
          )
      ),
    );
  }
}
