import 'package:efox_flutter/store/objects/widget_info.dart';
import 'checkbox/index.dart' as CheckBox;
import 'checkboxlisttile/index.dart' as CheckboxListTile;
import 'slider/index.dart' as Slider;
import 'textinput/index.dart' as textinput;
import 'textfield/index.dart' as textfield;
import 'switch/index.dart' as switchExample;
import 'rawkeyboard/index.dart' as rawkeyboard;
import 'radio/index.dart' as radio;
import 'formfield/index.dart' as formfield;
import 'form/index.dart' as form;
import 'daypicker/index.dart' as daypicker;

const nameSpaces = '/form_';

List widgets = [
  ItemInfo(
    widget: CheckBox.Index(),
    code: 57923, // format_paint
    title: CheckBox.Index.title
  ),
  ItemInfo(
    widget: CheckboxListTile.Index(),
    code: 59662, // gavel
    title: CheckboxListTile.Index.title
  ),
  ItemInfo(
    widget: Slider.Index(),
    code: 60229, // golf_course
    title: Slider.Index.title
  ),
  ItemInfo(
    widget: daypicker.Index(),
    code: 58345, // gradient
    title: daypicker.Index.title
  ),
  ItemInfo(
    widget: form.Index(),
    code: 59526, // group_work
    title: form.Index.title
  ),
  ItemInfo(
    widget: formfield.Index(),
    code: 60230, // hot_tub
    title: formfield.Index.title
  ),
  ItemInfo(
    widget: radio.Index(),
    code: 58693, // local_florist 
    title: radio.Index.title
  ),
  ItemInfo(
    widget: rawkeyboard.Index(),
    code: 58698, // local_laundry_service
    title: rawkeyboard.Index.title
  ),
  ItemInfo(
    widget: switchExample.Index(),
    code: 58706, // local_pizza
    title: switchExample.Index.title
  ),
  ItemInfo(
    widget: textfield.Index(),
    code: 58715, // map
    title: textfield.Index.title
  ),
  ItemInfo(
    widget: textinput.Index(),
    code: 58146, // memory
    title: textinput.Index.title
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