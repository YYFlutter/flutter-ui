import 'package:efox_flutter/store/objects/widget_info.dart';
import 'gridview/index.dart' as gridview;
import 'listview/index.dart' as listview;

const nameSpaces = '/scrollview_';

List widgets = [
  ItemInfo(
    widget: gridview.Index(),
    code: 59632, // view_module
    title: gridview.Index.title,
  ),
  ItemInfo(
    widget: listview.Index(),
    code: 59631, // view_list
    title: listview.Index.title,
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