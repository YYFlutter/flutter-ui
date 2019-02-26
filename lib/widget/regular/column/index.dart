import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo.dart' as Demo;
import 'demo_expanded.dart' as DemoExpanded;

class Index extends StatefulWidget {
  static String name = 'Column';
  static String routerName = 'column';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Column-class.html';
  static String codeUrl = 'docs/widget/regular/column/code.md';
  static String mdUrl = 'docs/widget/regular/column/index.md';

  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return WidgetComp.Index(
      name: Index.name,
      codeUrl: Index.codeUrl,
      originCodeUrl: Index.originCodeUrl,
      mdUrl: Index.mdUrl,
      demoChild: <Widget>[
        Demo.Index(),
        DemoExpanded.Index()
      ],
    );
  }
}