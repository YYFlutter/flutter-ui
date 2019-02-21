import 'package:efox_flutter/store/objects/widget_info.dart';
import 'gridview/index.dart' as GridView;

const nameSpaces = '/scrollview_';

List widgets = [
  ItemInfo(
    routerName: nameSpaces + GridView.Demo.routerName,
    widget: GridView.Demo(),
    code: 59673,
    name: GridView.Demo.name,
  )
];

List widgetMap = [
  ItemListInfo(
    widgetList: widgets,
    typeName: 'ScrollView',
    code: 58353,
  )
];