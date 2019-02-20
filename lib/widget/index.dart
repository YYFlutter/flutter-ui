import 'scrollview/index.dart' as ScrollView;

List getAllWidgets() {
  List routerMap =[];
  routerMap.addAll(ScrollView.widgetMap);
  return routerMap;
}