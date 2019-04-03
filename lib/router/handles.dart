import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:efox_flutter/components/webview_comp.dart' as webview_comp;

Handler webviewHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String url = params["url"]?.first;
    String title = params["title"]?.first ?? 'WebView';
    return webview_comp.Index(
      url: url,
      title: title
    );
  },
);