import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  double _top = 0;
  double _left = 0;
  @override
  void initState() {
    super.initState();
  }

  setPanEvent(txt, [ev]) {
    print('$txt  $ev');

    if (ev != null && ev.delta != null) {
      setState(() {
        _top += ev.delta.dy;
        _left += ev.delta.dx;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GestureDetectorDrag'),
          automaticallyImplyLeading: false,
        ),
        body: ConstrainedBox(
          // 占位撑开全屏
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Text('Top: $_top,  Left: $_left'),
              Positioned(
                width: 80,
                height: 80,
                top: _top,
                left: _left,
                child: GestureDetector(
                  child: CircleAvatar(
                    child: Text("Drag"),
                  ),
                  onPanStart: (DragStartDetails ev) {
                    print('onPanStart $ev');
                  },
                  // DragEndDetails结束时用户滑动的瞬间速度
                  onPanEnd: (DragEndDetails ev) {
                    print('end $ev');
                  },
                  onPanCancel: () {
                    setPanEvent('onPanCancel');
                  },
                  // DragDownDetails返回相对屏幕的位置
                  onPanDown: (DragDownDetails ev) {
                    print('DragDownDetails ${ev.globalPosition}');
                  },
                  onPanUpdate: (DragUpdateDetails ev) {
                    setPanEvent('onPanUpdate', ev);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
