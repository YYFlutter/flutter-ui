import 'package:flutter/widgets.dart';

import 'package:efox_flutter/widget/scrollview/GridView/gridview.dart';

const nameSpaces = 'scrollview_';
const gridview = nameSpaces + 'gridview';

const routerMaps = {
  gridview: '/widget/scrollview/GridView/gridview',
};

Map<String, WidgetBuilder> getScrollViewRoutersConfig(BuildContext context) {
  return {
    routerMaps[gridview] : (context) => GridViewDemo(),
  };
}

Map<String, String> routesMapScrollView = {
  gridview: routerMaps[gridview],
};
