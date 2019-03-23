import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart'
    show FlutterWebviewPlugin, WebviewScaffold;

class Index extends StatelessWidget {
  final String url;
  final String title;
  Index({Key key, @required this.url, this.title}) : super(key: key);

  void controller() {
    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print('url ${url}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.url,
      enableAppScheme: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          this.title,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).primaryTextTheme.title.color,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
    );
  }
}
