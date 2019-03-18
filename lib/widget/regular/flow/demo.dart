/**
 * auth: linhaoran
 * Email: 1476589247@qq.com
 */
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  final List<dynamic> containerValue = [
    Colors.deepOrangeAccent,
    Colors.cyanAccent,
    Colors.limeAccent,
    Colors.deepPurpleAccent,
    Colors.indigo,
    Colors.lightGreenAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flow'),),
      body: Flow(
        delegate: FlowDelegateFunc(margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0)),
        children: List.generate(6, (index) {
          return Container(
            width: 46.0,
            height: 40.0,
            color: containerValue[index],
          );
        }),
      ),
    );
  }
}

class FlowDelegateFunc extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  FlowDelegateFunc({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}