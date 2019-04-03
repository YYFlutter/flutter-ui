import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widget_comp.dart' as widget_comp;
import 'demo.dart' as Demo;
import 'demo_builder.dart' as DemoBuilder;
import 'demo_separated.dart' as DemoSeparated;
import 'demo_custom.dart' as DemoCustom;

class Index extends StatefulWidget {
  static String title = 'ListView';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/ListView-class.html';
  static String mdUrl = 'docs/widget/regular/listview/index.md';
  @override
  _IndexState createState() => _IndexState();
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
        DemoBuilder.Index(),
        DemoSeparated.Index(),
        DemoCustom.Index()
      ],
    );
  }
}