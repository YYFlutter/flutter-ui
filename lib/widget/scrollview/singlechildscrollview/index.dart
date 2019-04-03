import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widget_comp.dart' as widget_comp;
import 'demo_single_child_scrollview.dart' as DemoSingleChildScrollview;
import 'demo_single_child_scrollview_overflow.dart' as DemoSingleChildScrollviewOverflow;

class Index extends StatefulWidget {
  static String title = 'SingleChildScrollview';
  static String mdUrl = 'docs/widget/scrollview/singlechildscrollview/index.md';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/SingleChildScrollView-class.html';

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
          DemoSingleChildScrollview.Index(),
          DemoSingleChildScrollviewOverflow.Index(),
        ]
    );
  }
}
