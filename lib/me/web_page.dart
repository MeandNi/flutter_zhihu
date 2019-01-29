import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';

class WebPage extends StatefulWidget {
  final String url;
  final String title;

  WebPage({@required this.url, this.title});

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.widget.url,
      appBar: new AppBar(
        title: new Text(this.widget.title ?? 'Meandni'),
        backgroundColor: Colors.white,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Share.share(this.widget.url);
            },
            child: Icon(Icons.share),
          )
        ],
      ),
    );
  }
}
