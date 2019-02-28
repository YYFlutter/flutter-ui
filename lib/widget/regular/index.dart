import 'package:efox_flutter/store/objects/widget_info.dart';
import 'row/index.dart' as Row;
import 'column/index.dart' as Column;
import 'container/index.dart' as Container;
import 'padding/index.dart' as Padding;
import 'align/index.dart' as Align;
import 'center/index.dart' as Center;
import 'fittedbox/index.dart' as FittedBox;
import 'aspectratio/index.dart' as AspectRatio;

const nameSpaces = '/regular_';

List widgets = [
  ItemInfo(
    widget: Row.Index(),
    code: 59702, // calendar_view_day
    title: Row.Index.title,
  ),
  ItemInfo(
    widget: Column.Index(),
    code: 59692, // accessibility_new
    title: Column.Index.title
  ),
  ItemInfo(
    widget: Container.Index(),
    code: 60219, // ac_unit 
    title: Container.Index.title
  ),
  ItemInfo(
    widget: Padding.Index(),
    code: 59483, // aspect_ratio
    title: Padding.Index.title
  ),
  ItemInfo(
    widget: Align.Index(),
    code: 57917, // format_indent_decrease
    title: Align.Index.title
  ),
  ItemInfo(
    widget: Center.Index(),
    code: 57932, // format_indent_decrease
    title: Center.Index.title
  ),
  ItemInfo(
    widget: FittedBox.Index(),
    code: 60231, // format_indent_decrease
    title: FittedBox.Index.title
  ),
  ItemInfo(
    widget: AspectRatio.Index(),
    code: 58688, // local_bar
    title: AspectRatio.Index.title
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