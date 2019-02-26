import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo.dart' as Demo;


class Index extends StatefulWidget {
  static String name = 'Container';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Container-class.html';
  static String codeUrl = 'docs/widget/regular/container/code.md';
  static String mdUrl = 'docs/widget/regular/container/index.md';

  @override
  _IndexState createState() => _IndexState();
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
        Demo.Index()
      ],
    );
  }
}