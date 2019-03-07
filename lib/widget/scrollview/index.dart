import 'package:efox_flutter/store/objects/widget_info.dart';
import 'gridview/index.dart' as gridview;
// import 'listview/index.dart' as listview;
import '../regular/listview/index.dart' as listview;
import 'scrollable/index.dart' as scrollable;
import 'customscrollview/index.dart' as customscrollview;
import 'singlechildscrollview/index.dart' as singlechildscrollview;
import 'scrollbar/index.dart' as scrollbar;
import 'scrollcontroller/index.dart' as scrollcontroller;
import 'nestedscrollview/index.dart' as nestedscrollview;


const nameSpaces = '/scrollview_';

List widgets = [
  ItemInfo(
    widget: gridview.Index(),
    code: 58348, // grid_on
    title: gridview.Index.title,
  ),
  ItemInfo(
    widget: listview.Index(),
    code: 59631, // view_list
    title: listview.Index.title,
  ),
  ItemInfo(
    widget: scrollable.Index(),
    code: 57920, // format_line_spacing
    title: scrollable.Index.title,
  ),
  ItemInfo(
    widget: customscrollview.Index(),
    code: 57908, // format_align_center
    title: customscrollview.Index.title,
  ),
  ItemInfo(
    widget: singlechildscrollview.Index(),
    code: 57909, // format_align_justify
    title: singlechildscrollview.Index.title,
  ),
  ItemInfo(
    widget: scrollbar.Index(),
    code: 59614, // toc
    title: scrollbar.Index.title,
  ),
  ItemInfo(
    widget: scrollcontroller.Index(),
    code: 57539, // import_export 
    title: scrollcontroller.Index.title,
  ),
  ItemInfo(
    widget: nestedscrollview.Index(),
    code: 57945, // vertical_align_center
    title: nestedscrollview.Index.title,
  ),
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'ScrollComponents',
    code: 57427, // sort_by_alpha
  )
];