import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart';
import 'intro.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => new _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return WidgetComp(
      title: 'GridViewDemo',
      modelChild: (context, child, model) {
        return [
          md_01,
          Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.teal.shade700,
            alignment: Alignment.center,
            child: Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
            transform: Matrix4.rotationZ(0.1),
          ),
          Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.teal.shade700,
            alignment: Alignment.center,
            child: Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
            transform: Matrix4.rotationZ(0.1),
          ),
        ];
      },
    );
  }
}
