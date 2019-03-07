import 'package:efox_flutter/store/objects/widget_info.dart';
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
    widget: animatedbuilder.Index(),
    code: 58348, // grid_on
    title: animatedbuilder.Index.title,
  ),
  ItemInfo(
    widget: animatedcontainer.Index(),
    code: 58348, // grid_on
    title: animatedcontainer.Index.title,
  ),
  ItemInfo(
    widget: animatedcrossfade.Index(),
    code: 58348, // grid_on
    title: animatedcrossfade.Index.title,
  ),
  ItemInfo(
    widget: animateddefaulttextstyle.Index(),
    code: 58348, // grid_on
    title: animateddefaulttextstyle.Index.title,
  ),
  ItemInfo(
    widget: animatedliststate.Index(),
    code: 58348, // grid_on
    title: animatedliststate.Index.title,
  ),
  ItemInfo(
    widget: animatedmodalbarrier.Index(),
    code: 58348, // grid_on
    title: animatedmodalbarrier.Index.title,
  ),
  ItemInfo(
    widget: slidetransition.Index(),
    code: 58348, // grid_on
    title: slidetransition.Index.title,
  ),
  ItemInfo(
    widget: sizetransition.Index(),
    code: 58348, // grid_on
    title: sizetransition.Index.title,
  ),
  ItemInfo(
    widget: scaletransition.Index(),
    code: 58348, // grid_on
    title: scaletransition.Index.title,
  ),
  ItemInfo(
    widget: rotationtransition.Index(),
    code: 58348, // grid_on
    title: rotationtransition.Index.title,
  ),
  ItemInfo(
    widget: positionedtransition.Index(),
    code: 58348, // grid_on
    title: positionedtransition.Index.title,
  ),
  ItemInfo(
    widget: hero.Index(),
    code: 58348, // grid_on
    title: hero.Index.title,
  ),
  ItemInfo(
    widget: fadetransition.Index(),
    code: 58348, // grid_on
    title: fadetransition.Index.title,
  ),
  ItemInfo(
    widget: decoratedboxtransition.Index(),
    code: 58348, // grid_on
    title: decoratedboxtransition.Index.title,
  ),
  ItemInfo(
    widget: animatedwidgetbasestate.Index(),
    code: 58348, // grid_on
    title: animatedwidgetbasestate.Index.title,
  ),
  ItemInfo(
    widget: animatedwidget.Index(),
    code: 58348, // grid_on
    title: animatedwidget.Index.title,
  ),
  ItemInfo(
    widget: animatedsize.Index(),
    code: 58348, // grid_on
    title: animatedsize.Index.title,
  ),
  ItemInfo(
    widget: animatedpositioned.Index(),
    code: 58348, // grid_on
    title: animatedpositioned.Index.title,
  ),
  ItemInfo(
    widget: animatedphysicalmodel.Index(),
    code: 58348, // grid_on
    title: animatedphysicalmodel.Index.title,
  ),
  ItemInfo(
    widget: animatedopacity.Index(),
    code: 58348, // grid_on
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