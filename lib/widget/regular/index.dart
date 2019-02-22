import 'package:efox_flutter/store/objects/widget_info.dart';
import 'gridview/index.dart' as GridView;

const nameSpaces = '/Regular_';

List widgets = [
  ItemInfo(
    routerName: nameSpaces + GridView.Index.routerName,
    widget: GridView.Index(),
    code: 59673,
    name: GridView.Index.name,
  )
];

List widgetMap = [
  ItemListInfo(
    widgetList: widgets,
    typeName: 'Regular',
    code: 58353,
  )
];