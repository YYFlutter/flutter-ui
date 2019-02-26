import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo_count.dart' as DemoCount;
import 'demo_extent.dart' as DemoExtent;
import 'demo_custom.dart' as DemoCustom;
import 'demo_builder.dart' as DemoBuilder;

String mdUrl = 'docs/widget/scrollview/gridview/index.md';
String codeUrl = 'docs/widget/scrollview/gridview/code.md';
String codeUrl1 = 'docs/widget/scrollview/gridview/code.md';
String originCodeUrl = 'https://flutter.io/docs/cookbook/lists/grid-lists';

class Index extends StatefulWidget {
  static String name = 'GridView';
  static String routerName = 'gridview';

  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return WidgetComp.Index(
      name: Index.name,
      codeUrl: codeUrl,
      originCodeUrl: originCodeUrl,
      mdUrl: mdUrl,
      demoChild: [
        DemoCount.Index(),
        DemoExtent.Index(),
        DemoCustom.Index(),
        DemoBuilder.Index(),
      ]
    );
  }
}
