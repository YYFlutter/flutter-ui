import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widget_comp.dart' as widget_comp;
import 'demo.dart' as Demo;
import 'demo_expanded.dart' as DemoExpanded;

class Index extends StatefulWidget {
  static String title = 'Row';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Row-class.html';
  static String mdUrl = 'docs/widget/regular/row/index.md';

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
        Demo.Index(),
        DemoExpanded.Index()
      ]
    );
  }
}
