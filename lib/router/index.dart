import 'package:flutter/widgets.dart';
import 'package:fluro/fluro.dart';
//首页
import 'package:efox_flutter/page/home.dart';

import 'package:flutter/material.dart';
import 'handles.dart';
import 'scrollview/index.dart' as scrollview;

class FluroRouter {
  static Router router;

  static Router initRouter(Router router) {
    FluroRouter.router = router;
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return HomePage();
        },
      ),
    );

    router.define('/webview', handler: webviewHandler);
    
    scrollview.initRouter(router);
    return router;
  }
}
