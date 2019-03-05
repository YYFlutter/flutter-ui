import 'scrollview/index.dart' as scrollview;
import 'regular/index.dart' as regular;
import 'navigator/index.dart' as navigator;
import 'bulletbox/index.dart' as BulletBox;
import 'form/index.dart' as Form;
List getAllWidgets() {
  List routerMap =[];
  routerMap.addAll(scrollview.widgetMap);
  routerMap.addAll(regular.widgetMap);
  routerMap.addAll(navigator.widgetMap);
  routerMap.addAll(BulletBox.widgetMap);
  routerMap.addAll(Form.widgetMap);
  return routerMap;
}