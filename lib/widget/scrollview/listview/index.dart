import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;

class Index extends StatefulWidget {
  static String title = 'GridView';
  static String mdUrl = 'docs/widget/scrollview/gridview/index.md';
  static String codeUrl = 'docs/widget/scrollview/gridview/code.md';
  static String originCodeUrl = 'https://flutter.io/docs/cookbook/lists/grid-lists';

  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return WidgetComp.Index(
      title: Index.title,
      codeUrl: Index.codeUrl,
      originCodeUrl: Index.originCodeUrl,
      mdUrl: Index.mdUrl,
      demoChild: [
      ]
    );
  }
}
