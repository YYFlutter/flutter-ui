import 'scrollview/index.dart' as ScrollView;
import 'regular/index.dart' as RegularView;

List getAllWidgets() {
  List routerMap =[];
  routerMap.addAll(ScrollView.widgetMap);
  routerMap.addAll(RegularView.widgetMap);
  return routerMap;
}