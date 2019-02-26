import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo.dart' as Demo;

String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Container-class.html';
String codeUrl = 'docs/widget/regular/container/code.md';
String mdUrl = 'docs/widget/regular/container/index.md';

class Index extends StatefulWidget {
  static String name = 'Container';
  static String routerName = 'container';

  @override
  _IndexState createState() => _IndexState();
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
        Demo.Index()
      ],
    );
  }
}