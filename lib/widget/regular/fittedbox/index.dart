import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo.dart' as Demo;

class Index extends StatefulWidget {
  static String title = 'FittedBox';
  static String originCodeUrl = '';
  static String codeUrl = 'docs/widget/regular/fittedbox/code.md';
  static String mdUrl = 'docs/widget/regular/fittedbox/index.md';
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return WidgetComp.Index(
      title: Index.title,
      codeUrl: Index.codeUrl,
      originCodeUrl: Index.originCodeUrl,
      mdUrl: Index.mdUrl,
      demoChild: <Widget>[
        Demo.Index()
      ],
    );
  }
}