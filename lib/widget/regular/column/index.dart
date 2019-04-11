import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widget_comp.dart' as widget_comp;
import 'demo.dart' as Demo;
import 'demo_expanded.dart' as DemoExpanded;

class Index extends StatefulWidget {
  static String title = 'Column';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Column-class.html';
  static String mdUrl = 'docs/widget/regular/column/index.md';

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
      demoChild: <Widget>[
        Demo.Index(),
        DemoExpanded.Index()
      ],
    );
  }
}