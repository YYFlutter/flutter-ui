import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widget_comp.dart' as widget_comp;
import 'demo_custom_scrollview.dart' as DemoCustomScrollview;
import 'demo_custom_scrollview_pinned.dart' as DemoCustomScrollviewPinned;
import 'demo_custom_scrollview_floating.dart' as DemoCustomScrollviewFloating;
import 'demo_custom_scrollview_floaing_snap.dart' as DemoCustomScrollviewFloatingSnap;

class Index extends StatefulWidget {
  static String title = 'CustomScrollView';
  static String mdUrl = 'docs/widget/scrollview/customscrollview/index.md';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Scrollable-class.html';

  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return widget_comp.Index(
      title: Index.title,
      originCodeUrl: Index.originCodeUrl,
      mdUrl: Index.mdUrl,
      demoChild: [
        DemoCustomScrollview.Index(),
        DemoCustomScrollviewPinned.Index(),
        DemoCustomScrollviewFloating.Index(),
        DemoCustomScrollviewFloatingSnap.Index(),
      ]
    );
  }
}
