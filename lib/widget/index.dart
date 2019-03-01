import 'scrollview/index.dart' as scrollview;
import 'regular/index.dart' as regular;
import 'navigator/index.dart' as navigator;
List getAllWidgets() {
  List routerMap =[];
  routerMap.addAll(scrollview.widgetMap);
  routerMap.addAll(regular.widgetMap);
  routerMap.addAll(navigator.widgetMap);
  return routerMap;
}