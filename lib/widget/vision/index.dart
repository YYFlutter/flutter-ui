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
    code: 59515, // extension 
    title: transform.Index.title,
  ),
  ItemInfo(
    widget: theme.Index(),
    code: 57442, // fiber_smart_record
    title: theme.Index.title,
  ),
  ItemInfo(
    widget: decoratedbox.Index(),
    code: 58331, // filter_b_and_w
    title: decoratedbox.Index.title,
  ),
  ItemInfo(
    widget: fractionaltranslation.Index(),
    code: 58333, // filter_drama
    title: fractionaltranslation.Index.title,
  ),
  ItemInfo(
    widget: mediaquery.Index(),
    code: 58335, // filter_hdr
    title: mediaquery.Index.title,
  ),
  ItemInfo(
    widget: opacity.Index(),
    code: 58339, // filter_vintage
    title: opacity.Index.title,
  ),
  ItemInfo(
    widget: rotatedbox.Index(),
    code: 58340, // flare
    title: rotatedbox.Index.title,
  ),
  ItemInfo(
    widget: backdropfilter.Index(),
    code: 57914, // format_color_fill
    title: backdropfilter.Index.title,
  ),
  ItemInfo(
    widget: clipoval.Index(),
    code: 57950, // format_shapes
    title: clipoval.Index.title,
  ),
  ItemInfo(
    widget: clippath.Index(),
    code: 57929, // format_underlined 
    title: clippath.Index.title,
  ),
  ItemInfo(
    widget: cliprect.Index(),
    code: 60228, // free_breakfast
    title: cliprect.Index.title,
  ),
  ItemInfo(
    widget: custompaint.Index(),
    code: 57377, // games
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