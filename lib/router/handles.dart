import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:efox_flutter/components/webviewComp.dart';

Handler webviewHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String url = params["url"]?.first;
    String title = params["title"]?.first ?? 'WebView';
    return WebViewComp(
      url: url,
      title: title
    );
  },
);