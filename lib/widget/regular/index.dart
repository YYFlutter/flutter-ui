import 'package:efox_flutter/store/objects/widget_info.dart';
import 'row/index.dart' as Row;

const nameSpaces = '/Regular_';

List widgets = [
  ItemInfo(
    routerName: nameSpaces + Row.Index.routerName,
    widget: Row.Index(),
    code: 59692,
    name: Row.Index.name,
  )
];

List widgetMap = [
  ItemListInfo(
    widgetList: widgets,
    typeName: 'Regular',
    code: 59692,
  )
];