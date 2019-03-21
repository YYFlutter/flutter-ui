import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool isOn = false;
  String _value = '';
  @override
  void initState() {
    super.initState();
  }

  updateText(txt) {
    setState(() {
      _value = txt;
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
          children: <Widget>[
            Text("点击时，会先触发Tap事件，再触发Pan事件"),
            Text("触发外层滚动时，会触发onPanCancel事件"),
            GestureDetector(
              onPanDown: (DragDownDetails  ev) {
                print('onPanDown');
                updateText('onPanDown $ev');
              },
              onPanStart: (DragStartDetails ev) {
                print('onPanStart');
                updateText('onPanStart $ev');
              },
              onPanUpdate: (DragUpdateDetails ev) {
                print('onPanUpdate');
                updateText('onPanUpdate $ev');
              },
              onPanEnd: (DragEndDetails ev) {
                print('onPanEnd');
                updateText('onPanEnd $ev');
              },
              onPanCancel: () {
                print('onPanCancel');
                updateText('onPanCancel');
              },
              // 连接点击两次的话，不会触发onTap，只会触发 onDoubleTap
              onTap: () {
                updateText('onTap');
                setState(() {
                  isOn = !isOn;
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 200,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('TURN LIGHTS ON'),
                    Divider(),
                    Icon(
                      Icons.lightbulb_outline,
                      color: isOn ? Colors.yellow : Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Text(_value),
          ],
        ),
      ),
    );
  }
}
