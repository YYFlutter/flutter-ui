import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widget_comp.dart' as widget_comp;
import 'demo.dart' as Demo;
import 'demo_tap.dart' as DemoTap;
import 'demo_pan.dart' as DemoPanDrag;
import 'demo_force_press.dart' as DemoForcePress;
import 'demo_scale.dart' as DemoScale;

class Index extends StatefulWidget {
  static String title = 'GestureDetector';
  static String mdUrl = 'docs/widget/gestures/gesturedetector/index.md';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/GestureDetector-class.html';

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
        Demo.Index(),
        DemoTap.Index(),
        DemoPanDrag.Index(),
        DemoForcePress.Index(),
        DemoScale.Index(),
      ],
    );
  }
}
