import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo.dart' as Demo;
import 'demo_expanded.dart' as DemoExpanded;

String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Column-class.html';
String codeUrl = 'docs/widget/regular/column/code.md';
String mdUrl = 'docs/widget/regular/column/index.md';

class Index extends StatefulWidget {
  static String name = 'Column';
  static String routerName = 'column';

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
      demoChild: <Widget>[
        Demo.Index(),
        DemoExpanded.Index()
      ],
    );
  }
}