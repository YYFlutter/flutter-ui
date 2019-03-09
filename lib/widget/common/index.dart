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
    code: 58273, // audiotrack
    title: divider.Index.title,
  ),
  ItemInfo(
    widget: flatbutton.Index(),
    code: 58275, // blur_linear
    title: flatbutton.Index.title,
  ),
  ItemInfo(
    widget: icon.Index(),
    code: 59493, // book
    title: icon.Index.title,
  ),
  ItemInfo(
    widget: iconbutton.Index(),
    code: 57903, // border_outer 
    title: iconbutton.Index.title,
  ),
  ItemInfo(
    widget: image.Index(),
    code: 58283, // brightness_6 
    title: image.Index.title,
  ),
  ItemInfo(
    widget: listtile.Index(),
    code: 58284, // brightness_7
    title: listtile.Index.title,
  ),
  ItemInfo(
    widget: placeholder.Index(),
    code: 57771, // brightness_auto 
    title: placeholder.Index.title,
  ),
  ItemInfo(
    widget: raisedbutton.Index(),
    code: 58285, // broken_image
    title: raisedbutton.Index.title,
  ),
  ItemInfo(
    widget: rawimage.Index(),
    code: 60223, // business_center 
    title: rawimage.Index.title,
  ),
  ItemInfo(
    widget: stepper.Index(),
    code: 58428, // burst_mode
    title: stepper.Index.title,
  ),
  ItemInfo(
    widget: text.Index(),
    code: 58287, // camera
    title: text.Index.title,
  ),
  ItemInfo(
    widget: tooltip.Index(),
    code: 58291, // camera_roll
    title: tooltip.Index.title,
  ),
  ItemInfo(
    widget: assetbundle.Index(),
    code: 58740, // category
    title: assetbundle.Index.title,
  ),
  ItemInfo(
    widget: buttonbar.Index(),
    code: 60225, // child_care
    title: buttonbar.Index.title,
  ),
  ItemInfo(
    widget: chip.Index(),
    code: 60226, // child_friendly
    title: chip.Index.title,
  ),
  ItemInfo(
    widget: container.Index(),
    code: 57372, // closed_caption
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