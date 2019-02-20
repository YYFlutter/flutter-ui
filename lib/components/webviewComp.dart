import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewComp extends StatelessWidget {
  final String url;
  final String title;
  WebViewComp({Key key, @required this.url, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.url,
      appBar: new AppBar(
        title: new Text("Widget webview"),
      ),
    );
  }
}
