import 'package:flutter/widgets.dart';
import 'package:fluro/fluro.dart';
//首页
import 'package:efox_flutter/page/home.dart' as HomePage;
// 评论详细页面
import 'package:efox_flutter/page/comment/details.dart' as CommentDetails; 
import 'package:efox_flutter/widget/index.dart' as WidgetConfig;
import 'handles.dart';
//统计
import 'package:efox_flutter/utils/analytics.dart' show analytics;

class FluroRouter {
  static Router router;

  static webview({context, title, url}) {
    router.navigateTo(context, '/webview?title=${title}&url=${url}');
  }

  static Router initRouter() {
    FluroRouter.router = Router();
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return HomePage.Index();
        },
      ),
    );
    // 评论详情页面
    router.define(
      '/commentdetails',
      handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          String indexes = params["indexes"]?.first;
          return CommentDetails.Index(
            indexes: int.parse('${indexes}')
          );
        }
      )
    );

    router.define('/webview', handler: webviewHandler);

    // 组件
    WidgetConfig.getAllWidgets().forEach((widgetsItem) {
      print('widgetsItem $widgetsItem');
      widgetsItem.widgetList.forEach((itemInfo) {
        router.define(
          widgetsItem.nameSpaces + itemInfo.title,
          handler: Handler(
              handlerFunc: (BuildContext context, Map<String, List> params) {
            print('组件路由params=$params widgetsItem=${itemInfo.title}');
            analytics.logEvent(
                name: 'component', parameters: {'name': itemInfo.title});
            return itemInfo.widget;
          }),
        );
      });
    });
    return router;
  }
}
