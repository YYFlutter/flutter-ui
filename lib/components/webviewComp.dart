import 'package:flutter/material.dart';
import 'headerComp.dart' as Header;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart' show FlutterWebviewPlugin, WebviewScaffold;

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
      appBar: new AppBar(
        title: Header.Index(this.title),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      // initialChild: Container(
      //   child: const Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
    );
  }
}
