import 'package:flutter/material.dart';
import 'package:efox_flutter/page/baseComp.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => new _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return BaseComp(
      title: 'GridViewDemo',
      child: (context, child, model) {
        return Center(
          child: Text(
            'Griview',
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        );
      },
    );
  }
}
