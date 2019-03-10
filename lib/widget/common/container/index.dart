import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
 import 'package:efox_flutter/widget/regular/container/demo.dart' as Demo;

class Index extends StatefulWidget {
  static String title = 'Container';
  static String mdUrl = 'docs/widget/regular/container/index.md';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Container-class.html';

  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return WidgetComp.Index(
      title: Index.title,
      originCodeUrl: Index.originCodeUrl,
      mdUrl: Index.mdUrl,
      demoChild: [
         Demo.Index(),
      ],
    );
  }
}
