import 'package:efox_flutter/store/objects/widget_info.dart';
import 'checkbox/index.dart' as CheckBox;

const nameSpaces = '/form_';

List widgets = [
  ItemInfo(
    widget: CheckBox.Index(),
    code: 57923, // format_paint
    title: CheckBox.Index.title
  )
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'Form',
    code: 58746 // fastfood
  )
];