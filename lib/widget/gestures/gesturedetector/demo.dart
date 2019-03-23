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
        automaticallyImplyLeading: false,
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
            Divider(
              height: 20,
            ),
            GestureDetector(
              onDoubleTap: () {
                updateText('onDoubleTap');
              },
              onTapDown: (TapDownDetails e) {
                updateText('onTapDown');
                print(e.globalPosition);
              },
              onTapCancel: () {
                updateText('onTapCancel');
              },
              // 连接点击两次的话，不会触发onTap，只会触发 onDoubleTap
              onTap: () {
                updateText('onTap');
                setState(() {
                  isOn = !isOn;
                });
              },
              child: Container(
                margin: EdgeInsets.all(10),
                color: Colors.red,
                child: ListTile(
                  leading: Icon(
                    Icons.lightbulb_outline,
                    color: isOn ? Colors.yellow : Colors.grey,
                  ),
                  title: Text("Click Here To Change Light"),
                ),
              ),
            ),
            Text('Event: $_value'),
            Text('Try to Double Click'),
            Divider(
              height: 40,
            ),
            Text("使用ForcePress相关属性将不会触发Tap属性"),
            GestureDetector(
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
                updateText2('onTap');
                setState(() {
                  isOn = !isOn;
                });
              },
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 50,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Tap or Double Tap is not useful'),
                  ],
                ),
              ),
            ),
            Text(_value2),
            Divider(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
