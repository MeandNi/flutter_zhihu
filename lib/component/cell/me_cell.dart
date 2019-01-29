import 'package:flutter/material.dart';

class MeCell extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;

  MeCell({this.title, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Icon(icon),
                  SizedBox(width: 20),
                  Text(title, style: TextStyle(fontSize: 16)),
                  Expanded(child: Container()),
                  Icon(Icons.arrow_forward_ios, size: 18.0,),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Colors.white70,
              margin: EdgeInsets.only(left: 60),
            ),
          ],
        ),
      ),
    );
  }
}
