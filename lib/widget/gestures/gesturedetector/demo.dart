import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool isOn = false;
  String _value = '';
  String _value2 = '';
  @override
  void initState() {
    super.initState();
  }

  updateText(txt) {
    setState(() {
      _value = txt;
    });
  }

  updateText2(txt) {
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
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('you click the button')));
              },
              child: Icon(
                Icons.share,
                color: Colors.red,
              ),
            ),
            GestureDetector(
              onPanStart: (ev) {
                updateText('onPanStart $ev');
              },
              onPanEnd: (ev) {
                updateText('onPanEnd $ev');
              },
              onPanCancel: () {
                updateText('onPanCancel');
              },
              onPanDown: (ev) {
                updateText('onPanDown $ev');
              },
              onPanUpdate: (ev) {
                updateText('onPanUpdate $ev');
              },
              onDoubleTap: () {
                updateText('onDoubleTap');
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
            GestureDetector(
              onLongPress: () {
                updateText2('onLongPress');
              },
              onForcePressEnd: (ev) {
                updateText2('onForcePressEnd ${ev.globalPosition}');
              },
              onForcePressStart: (ev) {
                updateText2('onForcePressStart ${ev.globalPosition}');
              },
              onForcePressUpdate: (ev) {
                updateText2('onForcePressUpdate ${ev.globalPosition}');
              },
              onForcePressPeak: (ev) {
                updateText2('onForcePressPeak ${ev.globalPosition}');
              },
              // 连接点击两次的话，不会触发onTap，只会触发 onDoubleTap
              onTap: () {
                updateText2('onDoubleTap');
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
                    Text('Tap or DoubleTap is not useful'),
                    Divider(),
                    Icon(
                      Icons.lightbulb_outline,
                      color: isOn ? Colors.yellow : Colors.grey,
                    )
                  ],
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
