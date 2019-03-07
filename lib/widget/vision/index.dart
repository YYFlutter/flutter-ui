import 'package:efox_flutter/store/objects/widget_info.dart';
import 'transform/index.dart' as transform;
import 'custompaint/index.dart' as custompaint;
import 'cliprect/index.dart' as cliprect;
import 'clippath/index.dart' as clippath;
import 'clipoval/index.dart' as clipoval;
import 'backdropfilter/index.dart' as backdropfilter;
import 'rotatedbox/index.dart' as rotatedbox;
import 'opacity/index.dart' as opacity;
import 'mediaquery/index.dart' as mediaquery;
import 'fractionaltranslation/index.dart' as fractionaltranslation;
import 'decoratedbox/index.dart' as decoratedbox;
import 'theme/index.dart' as theme;

const nameSpaces = '/vision_';

List widgets = [
  ItemInfo(
    widget: transform.Index(),
    code: 58348, // grid_on
    title: transform.Index.title,
  ),
  ItemInfo(
    widget: theme.Index(),
    code: 58348, // grid_on
    title: theme.Index.title,
  ),
  ItemInfo(
    widget: decoratedbox.Index(),
    code: 58348, // grid_on
    title: decoratedbox.Index.title,
  ),
  ItemInfo(
    widget: fractionaltranslation.Index(),
    code: 58348, // grid_on
    title: fractionaltranslation.Index.title,
  ),
  ItemInfo(
    widget: mediaquery.Index(),
    code: 58348, // grid_on
    title: mediaquery.Index.title,
  ),
  ItemInfo(
    widget: opacity.Index(),
    code: 58348, // grid_on
    title: opacity.Index.title,
  ),
  ItemInfo(
    widget: rotatedbox.Index(),
    code: 58348, // grid_on
    title: rotatedbox.Index.title,
  ),
  ItemInfo(
    widget: backdropfilter.Index(),
    code: 58348, // grid_on
    title: backdropfilter.Index.title,
  ),
  ItemInfo(
    widget: clipoval.Index(),
    code: 58348, // grid_on
    title: clipoval.Index.title,
  ),
  ItemInfo(
    widget: clippath.Index(),
    code: 58348, // grid_on
    title: clippath.Index.title,
  ),
  ItemInfo(
    widget: cliprect.Index(),
    code: 58348, // grid_on
    title: cliprect.Index.title,
  ),
  ItemInfo(
    widget: custompaint.Index(),
    code: 58348, // grid_on
    title: custompaint.Index.title,
  ),
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'Vision',
    code: 58408, // transform 
  )
];