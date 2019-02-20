import 'package:flutter/material.dart';
import 'package:efox_flutter/widget/scrollview/gridview/gridview.dart';
import 'package:fluro/fluro.dart';

const nameSpaces = '/scrollview_';
const gridview = nameSpaces + 'gridview';

const routerMaps = {
  gridview: '/widget/scrollview/gridview/gridview',
};

void initRouter(router) {
  router.define(
    gridview,
    handler: Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return GridViewDemo();
      },
    ),
  );
}
