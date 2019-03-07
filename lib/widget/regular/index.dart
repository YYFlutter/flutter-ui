import 'package:efox_flutter/store/objects/widget_info.dart';
import 'row/index.dart' as Row;
import 'column/index.dart' as Column;
import 'container/index.dart' as Container;
import 'padding/index.dart' as Padding;
import 'align/index.dart' as Align;
import 'center/index.dart' as Center;
import 'fittedbox/index.dart' as FittedBox;
import 'aspectratio/index.dart' as AspectRatio;
import 'constrainedbox/index.dart' as ConstrainedBox;
import 'wrap/index.dart' as Wrap;
import 'table/index.dart' as Table;
import 'flow/index.dart' as Flow;
import 'stack/index.dart' as Stack;
import 'listview/index.dart' as ListView;
import 'listbody/index.dart' as ListBody;
import 'layoutbuilder/index.dart' as LayoutBuilder;

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
  ),
  ItemInfo(
    widget: ConstrainedBox.Index(),
    code: 57709, // low_priority 
    title: ConstrainedBox.Index.title
  ),
  ItemInfo(
    widget: Wrap.Index(),
    code: 59385, // pages 
    title: Wrap.Index.title
  ),
  ItemInfo(
    widget: Table.Index(),
    code: 59568, // receipt 
    title: Table.Index.title
  ),
  ItemInfo(
    widget: Flow.Index(),
    code: 58915, // sd_card 
    title: Flow.Index.title
  ),
  ItemInfo(
    widget: Stack.Index(),
    code: 57795, // settings_system_daydream
    title: Stack.Index.title
  ),
  ItemInfo(
    widget: ListView.Index(),
    code: 60236, // spa
    title: ListView.Index.title
  ),
  ItemInfo(
    widget: ListBody.Index(),
    code: 57440, // art_track
    title: ListBody.Index.title
  ),
  ItemInfo(
    widget: LayoutBuilder.Index(),
    code: 59484, // assessment
    title: LayoutBuilder.Index.title
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