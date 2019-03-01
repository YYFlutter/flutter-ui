import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  List<Map<String, dynamic>> containerValue = [
    {
      'color': Colors.yellow
    },
    {
      'color': Colors.green
    },
    {
      'color': Colors.red
    },
    {
      'color': Colors.black
    },
    {
      'color': Colors.blue
    },
    {
      'color': Colors.lightGreenAccent
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flow'),),
      body: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)),
        children: List.generate(6, (index) {
          return Container(
            width: 40.0,
            height: 40.0,
            color: containerValue[index]['color'],
          );
        }),
      ),
    );
  }
}

class FlowDelegates extends FlowDelegate {
    @override
    void paintChildren(FlowPaintingContext context) {}

    @override
    bool shouldRepaint(FlowDelegate oldDelegeate) {
      return oldDelegeate != this;
    }
  }

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});
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