import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widget_comp.dart' as widget_comp;
import 'demo_count.dart' as DemoCount;
import 'demo_extent.dart' as DemoExtent;
import 'demo_custom.dart' as DemoCustom;
import 'demo_builder.dart' as DemoBuilder;

class Index extends StatefulWidget {
  static String title = 'GridView';
  static String mdUrl = 'docs/widget/scrollview/gridview/index.md';
  static String originCodeUrl = 'https://flutter.io/docs/cookbook/lists/grid-lists';

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
        DemoCount.Index(),
        DemoExtent.Index(),
        DemoCustom.Index(),
        DemoBuilder.Index(),
      ]
    );
  }
}
