import 'package:efox_flutter/store/objects/widget_info.dart';
import 'appbar/index.dart' as appbar;
import 'scaffold/index.dart' as scaffold;
import 'bottomnavigationbar/index.dart' as bottomnavigationbar;
import 'drawer/index.dart' as drawer;
import 'floatingactionbutton/index.dart' as floatingactionbutton;
import 'materialapp/index.dart' as materialapp;
import 'navigator/index.dart' as navigator;
import 'pageview/index.dart' as pageview;
import 'popupmenubutton/index.dart' as popupmenubutton;
import 'tabbar/index.dart' as tabbar;
import 'tabbarview/index.dart' as tabbarview;
import 'widgetsapp/index.dart' as widgetsapp;

const nameSpaces = '/navigator_';

List widgets = [
  ItemInfo(
    widget: appbar.Index(),
    code: 58729, // near_me
    title: appbar.Index.title,
  ),
  ItemInfo(
    widget: scaffold.Index(),
    code: 57439, // playlist_play
    title: scaffold.Index.title,
  ),
  ItemInfo(
    widget: materialapp.Index(),
    code: 58894, // adb
    title: materialapp.Index.title,
  ),
  ItemInfo(
    widget: floatingactionbutton.Index(),
    code: 58430, // add_photo_alternate
    title: floatingactionbutton.Index.title,
  ),
  ItemInfo(
    widget: drawer.Index(),
    code: 58928, // airline_seat_flat
    title: drawer.Index.title,
  ),
  ItemInfo(
    widget: bottomnavigationbar.Index(),
    code: 60220, // airport_shuttle
    title: bottomnavigationbar.Index.title,
  ),
  ItemInfo(
    widget: widgetsapp.Index(),
    code: 60221, // all_inclusive
    title: widgetsapp.Index.title,
  ),
  ItemInfo(
    widget: tabbarview.Index(),
    code: 57574, // alternate_email
    title: tabbarview.Index.title,
  ),
  ItemInfo(
    widget: tabbar.Index(),
    code: 57673, // archive
    title: tabbar.Index.title,
  ),
  ItemInfo(
    widget: popupmenubutton.Index(),
    code: 57440, // art_track
    title: popupmenubutton.Index.title,
  ),
  ItemInfo(
    widget: navigator.Index(),
    code: 59484, // assessment
    title: navigator.Index.title,
  ),
  ItemInfo(
    widget: pageview.Index(),
    code: 59488, // assessment
    title: pageview.Index.title,
  ),
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'Navigator',
    code: 58717,
  )
];
