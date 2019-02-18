import 'package:flutter/widgets.dart';

import 'package:efox_flutter/widget/scrollview/GridView/gridview.dart';

Map<String, WidgetBuilder> getScrollViewRoutersConfig(BuildContext context) {
  return {
    '/widget/scrollview/GridView/gridview': (context) => GridViewDemo(),
  };
}

const nameSpaces = 'scrollview_';
Map<String, String> routesMapScrollView = {
  nameSpaces + 'gridview': '/widget/scrollview/GridView/gridview',
};
