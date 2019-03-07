import 'package:efox_flutter/store/objects/widget_info.dart';
import 'simpledialog/index.dart' as SimpleDialog;
import 'alertdialog/index.dart' as AlertDialog;
import 'bottomsheet/index.dart' as BottomSheet;
import 'snackbar/index.dart' as SnackBar;
import 'expansionPanel/index.dart' as ExpansionPanel;

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
  ),
  ItemInfo(
    widget: BottomSheet.Index(),
    code: 59639, // card_membership 
    title: BottomSheet.Index.title
  ),
  ItemInfo(
    widget: SnackBar.Index(),
    code: 59670, // date_range 
    title: SnackBar.Index.title
  ),
  ItemInfo(
    widget: ExpansionPanel.Index(),
    code: 59651, // event_seat 
    title: ExpansionPanel.Index.title
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