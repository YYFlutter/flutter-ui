import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart' show RandomContainer;

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  // String _value1 = '';
  String _value2 = '';
  @override
  void initState() {
    super.initState();
  }

  // updateText(txt) {
  //   print(txt);
  //   setState(() {
  //     _value1 = txt;
  //   });
  // }

  updateText2(txt) {
    print(txt);
    setState(() {
      _value2 = txt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text("使用ForcePress相关属性将不会触发Tap属性"),
            // GestureDetector(
            //   onForcePressEnd: (ForcePressDetails ev) {
            //     updateText('onForcePressEnd ${ev} ${ev.globalPosition}');
            //   },
            //   onForcePressStart: (ForcePressDetails ev) {
            //     updateText('onForcePressStart ${ev} ${ev.globalPosition}');
            //   },
            //   onForcePressUpdate: (ForcePressDetails ev) {
            //     updateText('onForcePressUpdate ${ev} ${ev.globalPosition}');
            //   },
            //   onForcePressPeak: (ForcePressDetails ev) {
            //     updateText('onForcePressPeak ${ev} ${ev.globalPosition}');
            //   },
            //   child: RandomContainer(
            //     height: 100,
            //     width: 200,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Text(
            //             'Use onForcePressXX properties and Tap or DoubleTap are not useful'),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(
            //   height: 10,
            // ),
            // Text(_value1),
            Divider(
              height: 20,
            ),
            Text("监听水平或垂直滚动"),
            Text('以下是水平滚动，垂直不变化为0'),
            Divider(
              height: 20,
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: GestureDetector(
                onHorizontalDragDown: (DragDownDetails e) {
                  updateText2('onHorizontalDragDown $e ${e.globalPosition}');
                },
                onHorizontalDragStart: (DragStartDetails e) {
                  updateText2('onHorizontalDragStart $e ${e.globalPosition}');
                },
                onHorizontalDragUpdate: (DragUpdateDetails e) {
                  updateText2('onHorizontalDragUpdate $e ${e.globalPosition}');
                },
                onHorizontalDragEnd: (DragEndDetails e) {
                  updateText2('onHorizontalDragEnd $e ${e.velocity}');
                },
                onHorizontalDragCancel: () {
                  updateText2('onHorizontalDragCancel');
                },
                child: RandomContainer(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          'Use onForcePressXX properties and Tap or DoubleTap are not useful'),
                    ],
                  ),
                ),
              ),
            ),
            Text(_value2),
          ],
        ),
      ),
    );
  }
}
