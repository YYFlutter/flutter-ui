import 'package:efox_flutter/store/objects/widget_info.dart';
import 'gridview/index.dart' as gridview;
import 'listview/index.dart' as listview;
import 'scrollable/index.dart' as scrollable;

const nameSpaces = '/scrollview_';

List widgets = [
  ItemInfo(
    widget: gridview.Index(),
    code: 58348, // grid_on
    title: gridview.Index.title,
  ),
  ItemInfo(
    widget: listview.Index(),
    code: 59631, // view_list
    title: listview.Index.title,
  ),
  ItemInfo(
    widget: scrollable.Index(),
    code: 57920, // format_line_spacing
    title: scrollable.Index.title,
  )
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'ScrollComponents',
    code: 58353,
  )
];