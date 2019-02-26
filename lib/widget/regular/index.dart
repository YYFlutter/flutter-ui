import 'package:efox_flutter/store/objects/widget_info.dart';
import 'row/index.dart' as Row;
import 'column/index.dart' as Column;
import 'container/index.dart' as Container;
import 'padding/index.dart' as Padding;
import 'align/index.dart' as Align;

const nameSpaces = '/regular_';

List widgets = [
  ItemInfo(
    widget: Row.Index(),
    code: 59702, // calendar_view_day
    name: Row.Index.name,
  ),
  ItemInfo(
    widget: Column.Index(),
    code: 59692, // accessibility_new
    name: Column.Index.name
  ),
  ItemInfo(
    widget: Container.Index(),
    code: 60219, // ac_unit 
    name: Container.Index.name
  ),
  ItemInfo(
    widget: Padding.Index(),
    code: 59483, // aspect_ratio
    name: Padding.Index.name
  ),
  ItemInfo(
    routerName: nameSpaces + Align.Index.routerName,
    widget: Align.Index(),
    code: 57917, // format_indent_decrease
    name: Align.Index.name
  )
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'Regular',
    code: 59692,
  )
];