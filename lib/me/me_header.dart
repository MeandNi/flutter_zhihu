import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:homeapp/public.dart';

class MeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var user = UserManager.currentUser;

    return GestureDetector(
      onTap: () {
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundImage: CachedNetworkImageProvider(
                  "https://meandni.com/img/avatar.jpg"),
            ),
            SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'MeandNi',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'https://github.com/MeandNi',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
