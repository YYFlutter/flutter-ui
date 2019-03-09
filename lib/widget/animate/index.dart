import 'package:efox_flutter/store/objects/widget_info.dart';
import 'animationcontroller/index.dart' as AnimationController;
import 'animatedopacity/index.dart' as animatedopacity;
import 'animatedphysicalmodel/index.dart' as animatedphysicalmodel;
import 'animatedpositioned/index.dart' as animatedpositioned;
import 'animatedsize/index.dart' as animatedsize;
import 'animatedwidget/index.dart' as animatedwidget;
import 'animatedwidgetbasestate/index.dart' as animatedwidgetbasestate;
import 'decoratedboxtransition/index.dart' as decoratedboxtransition;
import 'fadetransition/index.dart' as fadetransition;
import 'hero/index.dart' as hero;
import 'positionedtransition/index.dart' as positionedtransition;
import 'rotationtransition/index.dart' as rotationtransition;
import 'scaletransition/index.dart' as scaletransition;
import 'sizetransition/index.dart' as sizetransition;
import 'slidetransition/index.dart' as slidetransition;
import 'animatedmodalbarrier/index.dart' as animatedmodalbarrier;
import 'animatedliststate/index.dart' as animatedliststate;
import 'animateddefaulttextstyle/index.dart' as animateddefaulttextstyle;
import 'animatedcrossfade/index.dart' as animatedcrossfade;
import 'animatedcontainer/index.dart' as animatedcontainer;
import 'animatedbuilder/index.dart' as animatedbuilder;

const nameSpaces = '/animate_';

List widgets = [
  ItemInfo(
    widget: AnimationController.Index(),
    code: 57685, // gesture
    title: AnimationController.Index.title,
  ),
  ItemInfo(
    widget: animatedbuilder.Index(),
    code: 58295, // color_lens
    title: animatedbuilder.Index.title,
  ),
  ItemInfo(
    widget: animatedcontainer.Index(),
    code: 58297, // compare
    title: animatedcontainer.Index.title,
  ),
  ItemInfo(
    widget: animatedcrossfade.Index(),
    code: 58936, // confirmation_number
    title: animatedcrossfade.Index.title,
  ),
  ItemInfo(
    widget: animateddefaulttextstyle.Index(),
    code: 57678, // content_cut
    title: animateddefaulttextstyle.Index.title,
  ),
  ItemInfo(
    widget: animatedliststate.Index(),
    code: 59660, // copyright 
    title: animatedliststate.Index.title,
  ),
  ItemInfo(
    widget: animatedmodalbarrier.Index(),
    code: 58060, // create_new_folder
    title: animatedmodalbarrier.Index.title,
  ),
  ItemInfo(
    widget: slidetransition.Index(),
    code: 59505, // dashboard
    title: slidetransition.Index.title,
  ),
  ItemInfo(
    widget: sizetransition.Index(),
    code: 58742, // departure_board
    title: sizetransition.Index.title,
  ),
  ItemInfo(
    widget: scaletransition.Index(),
    code: 58125, // developer_board
    title: scaletransition.Index.title,
  ),
  ItemInfo(
    widget: rotationtransition.Index(),
    code: 57776, // developer_mode
    title: rotationtransition.Index.title,
  ),
  ItemInfo(
    widget: positionedtransition.Index(),
    code: 58165, // device_hub
    title: positionedtransition.Index.title,
  ),
  ItemInfo(
    widget: hero.Index(),
    code: 58167, // devices_other
    title: hero.Index.title,
  ),
  ItemInfo(
    widget: fadetransition.Index(),
    code: 58674, // directions_boat
    title: fadetransition.Index.title,
  ),
  ItemInfo(
    widget: decoratedboxtransition.Index(),
    code: 58896, // disc_full 
    title: decoratedboxtransition.Index.title,
  ),
  ItemInfo(
    widget: animatedwidgetbasestate.Index(),
    code: 59509, // dns
    title: animatedwidgetbasestate.Index.title,
  ),
  ItemInfo(
    widget: animatedwidget.Index(),
    code: 59672, // donut_small 
    title: animatedwidget.Index.title,
  ),
  ItemInfo(
    widget: animatedsize.Index(),
    code: 57778, // dvr
    title: animatedsize.Index.title,
  ),
  ItemInfo(
    widget: animatedpositioned.Index(),
    code: 57373, // equalizer
    title: animatedpositioned.Index.title,
  ),
  ItemInfo(
    widget: animatedphysicalmodel.Index(),
    code: 59686, // euro_symbol
    title: animatedphysicalmodel.Index.title,
  ),
  ItemInfo(
    widget: animatedopacity.Index(),
    code: 58733, // ev_station
    title: animatedopacity.Index.title,
  ),
];

List widgetMap = [
  ItemListInfo(
    nameSpaces: nameSpaces,
    widgetList: widgets,
    typeName: 'Animate',
    code: 58162, // toys
  )
];