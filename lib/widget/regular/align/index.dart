import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo.dart' as Demo;

class Index extends StatefulWidget {
  static String title = 'Align';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Align-class.html';
  static String codeUrl = 'docs/widget/regular/align/code.md';
  static String mdUrl = 'docs/widget/regular/align/index.md';

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