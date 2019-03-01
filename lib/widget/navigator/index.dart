import 'package:efox_flutter/store/objects/widget_info.dart';
import 'appbar/index.dart' as appbar;
import 'scaffold/index.dart' as scaffold;
const nameSpaces = '/navigator_';

List widgets = [
  ItemInfo(
    widget: scaffold.Index(),
    code: 57439, // playlist_play
    title: scaffold.Index.title,
  ),
  ItemInfo(
    widget: appbar.Index(),
    code: 58729, // near_me
    title: appbar.Index.title,
  ),
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'navigator',
    code: 58717,
  )
];