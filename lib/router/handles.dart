import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:efox_flutter/components/webviewComp.dart' as WebViewComp;

Handler webviewHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String url = params["url"]?.first;
    String title = params["title"]?.first ?? 'WebView';
    return WebViewComp.Index(
      url: url,
      title: title
    );
  },
);