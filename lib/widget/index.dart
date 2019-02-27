import 'scrollview/index.dart' as scrollview;
import 'regular/index.dart' as regular;

List getAllWidgets() {
  List routerMap =[];
  routerMap.addAll(scrollview.widgetMap);
  routerMap.addAll(regular.widgetMap);
  return routerMap;
}