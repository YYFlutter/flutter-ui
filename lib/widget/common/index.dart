import 'package:efox_flutter/store/objects/widget_info.dart';
import 'container/index.dart' as container;
import 'chip/index.dart' as chip;
import 'buttonbar/index.dart' as buttonbar;
import 'assetbundle/index.dart' as assetbundle;
import 'tooltip/index.dart' as tooltip;
import 'text/index.dart' as text;
import 'stepper/index.dart' as stepper;
import 'rawimage/index.dart' as rawimage;
import 'raisedbutton/index.dart' as raisedbutton;
import 'placeholder/index.dart' as placeholder;
import 'listtile/index.dart' as listtile;
import 'image/index.dart' as image;
import 'iconbutton/index.dart' as iconbutton;
import 'icon/index.dart' as icon;
import 'flatbutton/index.dart' as flatbutton;
import 'divider/index.dart' as divider;

const nameSpaces = '/common_';

List widgets = [
  ItemInfo(
    widget: divider.Index(),
    code: 58348, // grid_on
    title: divider.Index.title,
  ),
  ItemInfo(
    widget: flatbutton.Index(),
    code: 58348, // grid_on
    title: flatbutton.Index.title,
  ),
  ItemInfo(
    widget: icon.Index(),
    code: 58348, // grid_on
    title: icon.Index.title,
  ),
  ItemInfo(
    widget: iconbutton.Index(),
    code: 58348, // grid_on
    title: iconbutton.Index.title,
  ),
  ItemInfo(
    widget: image.Index(),
    code: 58348, // grid_on
    title: image.Index.title,
  ),
  ItemInfo(
    widget: listtile.Index(),
    code: 58348, // grid_on
    title: listtile.Index.title,
  ),
  ItemInfo(
    widget: placeholder.Index(),
    code: 58348, // grid_on
    title: placeholder.Index.title,
  ),
  ItemInfo(
    widget: raisedbutton.Index(),
    code: 58348, // grid_on
    title: raisedbutton.Index.title,
  ),
  ItemInfo(
    widget: rawimage.Index(),
    code: 58348, // grid_on
    title: rawimage.Index.title,
  ),
  ItemInfo(
    widget: stepper.Index(),
    code: 58348, // grid_on
    title: stepper.Index.title,
  ),
  ItemInfo(
    widget: text.Index(),
    code: 58348, // grid_on
    title: text.Index.title,
  ),
  ItemInfo(
    widget: tooltip.Index(),
    code: 58348, // grid_on
    title: tooltip.Index.title,
  ),
  ItemInfo(
    widget: assetbundle.Index(),
    code: 58348, // grid_on
    title: assetbundle.Index.title,
  ),
  ItemInfo(
    widget: buttonbar.Index(),
    code: 58348, // grid_on
    title: buttonbar.Index.title,
  ),
  ItemInfo(
    widget: chip.Index(),
    code: 58348, // grid_on
    title: chip.Index.title,
  ),
  ItemInfo(
    widget: container.Index(),
    code: 58348, // grid_on
    title: container.Index.title,
  ),
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'Common',
    code: 58353,
  )
];