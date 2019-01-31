import 'package:flutter/widgets.dart';
//首页
import 'package:efox_flutter/page/home_page.dart';

//测试路由配置
import 'package:efox_flutter/router/test/index.dart';

Map<String, WidgetBuilder> getRoutesConfig(BuildContext context) {
  Map<String, WidgetBuilder> finalMap = {};
  finalMap.addAll({'/': (context) => HomePage()});
  finalMap.addAll(getTestRoutesConfig(context));
  return finalMap;
}
