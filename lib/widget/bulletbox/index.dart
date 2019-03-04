import 'package:efox_flutter/store/objects/widget_info.dart';
import 'simpledialog/index.dart' as SimpleDialog;
import 'alertdialog/index.dart' as AlertDialog;

const nameSpaces = '/bulletbox_';

List widgets = [
  ItemInfo(
    widget: SimpleDialog.Index(),
    code: 57451, // branding_watermark
    title: SimpleDialog.Index.title
  ),
  ItemInfo(
    widget: AlertDialog.Index(),
    code: 59644, // camera_enhance 
    title: AlertDialog.Index.title
  )
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'BulletBox',
    code: 59483 // aspect_ratio
  )
];