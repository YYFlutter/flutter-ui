import 'package:efox_flutter/store/objects/widget_info.dart';
import 'gridview/index.dart' as GridView;

const nameSpaces = '/scrollview_';

List widgets = [
  ItemInfo(
    widget: GridView.Index(),
    code: 59673,
    name: GridView.Index.name,
  )
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'ScrollView',
    code: 58353,
  )
];