import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo_single_child_scrollview.dart' as DemoSingleChildScrollview;
import 'demo_custom_scrollview.dart' as DemoCustomScrollview;

class Index extends StatefulWidget {
  static String title = 'Scrollable';
  static String mdUrl = 'docs/widget/scrollview/scrollable/index.md';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Scrollable-class.html';

  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return WidgetComp.Index(
      title: Index.title,
      originCodeUrl: Index.originCodeUrl,
      mdUrl: Index.mdUrl,
      demoChild: [
        DemoSingleChildScrollview.Index(),
        DemoCustomScrollview.Index(),
      ]
    );
  }
}
