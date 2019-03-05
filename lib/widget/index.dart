import 'scrollview/index.dart' as scrollview;
import 'regular/index.dart' as regular;
import 'navigator/index.dart' as navigator;
import 'form/index.dart' as form;
import 'bulletbox/index.dart' as bulletbox;
import 'vision/index.dart' as vision;
import 'animate/index.dart' as animate;
import 'gestures/index.dart' as gestures;
import 'common/index.dart' as common;
List getAllWidgets() {
  List routerMap =[];
  routerMap.addAll(scrollview.widgetMap);
  routerMap.addAll(regular.widgetMap);
  routerMap.addAll(form.widgetMap);
  routerMap.addAll(navigator.widgetMap);
  routerMap.addAll(bulletbox.widgetMap);
  routerMap.addAll(common.widgetMap);
  routerMap.addAll(animate.widgetMap);
  routerMap.addAll(gestures.widgetMap);
  routerMap.addAll(vision.widgetMap);
  return routerMap;
}