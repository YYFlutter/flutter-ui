import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final GlobalKey _menuKey = GlobalKey();
  PopupMenuButton popButton;
  dynamic _value;

  @override
  void initState() {
    super.initState();
    popButton = PopupMenuButton(
      onSelected: (val) {
        setState(() {
          _value = val;
        });
      },
      child: Icon(Icons.settings),
      key: _menuKey,
      itemBuilder: (context) => [
            PopupMenuItem(
              value: '设置1',
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.red,
                  ),
                  Text("设置1"),
                ],
              ),
            ),
          ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (val) {
              print('点击后接收到的key $val');
              setState(() {
                _value = val;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: '设置2',
                  child: Row(
                    children: [
                      Text("设置2"),
                      Icon(
                        Icons.settings,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: '设置3',
                  child: Text('设置3'),
                )
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              trailing: popButton,
              // onTap: () {
              //   dynamic _state = _menuKey.currentState;
              //   print('showButtonMenu $_state');
              //   // _state.showButtonMenu();
              // },
            ),
            Text(
              '当ListTile绑定了trailing属性，就可以通过currentState.showButtonMenu()触发',
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              child: Text("点击显示PopupMenu"),
              onPressed: () {
                dynamic _state = _menuKey.currentState;
                print('showButtonMenu $_state');
                _state.showButtonMenu();
              },
            ),
            Text('${_value !=null ? '你点击了 ' + _value : '当前未选择内容'}'),
          ],
        ),
      ),
    );
  }
}
