import 'package:flutter/widgets.dart';
//首页
import 'package:efox_flutter/page/home.dart';

//测试路由配置
import 'package:efox_flutter/router/test/index.dart';
import 'package:efox_flutter/router/scrollview/index.dart';

Map<String, WidgetBuilder> getRoutesConfig(BuildContext context) {
  Map<String, WidgetBuilder> finalMap = {};
  finalMap.addAll({'/': (context) => HomePage()});
  finalMap.addAll(getTestRoutesConfig(context));
  finalMap.addAll(getScrollViewRoutersConfig(context));
  return finalMap;
}

Map<String, String> routesMap() {
  Map<String, String> routesMap= {};
  routesMap.addAll(routesMapScrollView);
  return routesMap;
}
