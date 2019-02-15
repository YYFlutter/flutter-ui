import 'package:flutter/widgets.dart';

import 'package:efox_flutter/widget/scrollview/gridview.dart';

Map<String, WidgetBuilder> getScrollViewRoutersConfig(BuildContext context) {
  return {
    '/widget/scrollview/gridview': (context) => GridViewDemo(),
  };
}

const nameSpaces = 'ScrollView';
Map<String, String> routesMapScrollView = {
  nameSpaces + 'GridView': '/widget/scrollview/gridview',
};
