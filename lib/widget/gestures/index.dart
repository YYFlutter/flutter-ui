import 'package:efox_flutter/store/objects/widget_info.dart';
import 'longpressdraggable/index.dart' as longpressdraggable;
import 'ignorepointer/index.dart' as ignorepointer;
import 'gesturedetector/index.dart' as gesturedetector;
import 'dragtarget/index.dart' as dragtarget;
import 'dismissible/index.dart' as dismissible;
import 'absorbpointer/index.dart' as absorbpointer;

const nameSpaces = '/gestures_';

List widgets = [
  ItemInfo(
    widget: absorbpointer.Index(),
    code: 58348, // grid_on
    title: absorbpointer.Index.title,
  ),
  ItemInfo(
    widget: dismissible.Index(),
    code: 58348, // grid_on
    title: dismissible.Index.title,
  ),
  ItemInfo(
    widget: dragtarget.Index(),
    code: 58348, // grid_on
    title: dragtarget.Index.title,
  ),
  ItemInfo(
    widget: gesturedetector.Index(),
    code: 58348, // grid_on
    title: gesturedetector.Index.title,
  ),
  ItemInfo(
    widget: ignorepointer.Index(),
    code: 58348, // grid_on
    title: ignorepointer.Index.title,
  ),
  ItemInfo(
    widget: longpressdraggable.Index(),
    code: 58348, // grid_on
    title: longpressdraggable.Index.title,
  ),
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'Gestures',
    code: 58353,
  )
];