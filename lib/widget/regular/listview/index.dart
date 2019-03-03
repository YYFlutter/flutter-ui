import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo.dart' as Demo;
import 'demo_builder.dart' as DemoBuilder;

class Index extends StatefulWidget {
  static String title = 'ListView';
  static String originCodeUrl = '';
  static String mdUrl = 'docs/widget/regular/listview/index.md';
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return WidgetComp.Index(
      title: Index.title,
      originCodeUrl: Index.originCodeUrl,
      mdUrl: Index.mdUrl,
      demoChild: <Widget>[
        Demo.Index(),
        DemoBuilder.Index()
      ],
    );
  }
}