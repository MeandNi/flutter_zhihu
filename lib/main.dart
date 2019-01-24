import 'package:flutter/material.dart';
import 'package:flutter_zhihu/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZhiHu',
      theme: ThemeData(
        primaryColor: Colors.white,
//        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

