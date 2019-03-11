import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List showMBS = ['Option A', 'Option B', 'Option C'];
  String _choiceMBS = 'Nothing';
  List showBS = ["开始会话", "操作说明", "系统设置", "更多设置"];
  List icons = [Icons.chat, Icons.help, Icons.settings, Icons.more];

  Future _openShowModalBottomSheet () async {
    final option = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: ListView(
            children: List.generate(3, (index) {
              return ListTile(
                title: Text(showMBS[index]),
                onTap: (){
                  Navigator.pop(context, showMBS[index]);
                },
              );
            })
          ),
        );
      }
    );
    // 使用switch可以按情况对后续赋值
    setState(() {
      _choiceMBS = option;
    });
  }

  Future _openShowBottomSheet () async {
    await showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          height: 300.0,
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
              children: List.generate(4, (index) {
                return ListTile(
                  leading: new Icon(icons[index]),
                  title: new Text(showBS[index]),
                  onTap: () {
                    Navigator.pop(context, showBS[index]);
                  },
                );
              })
            ))
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomSheet'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: _openShowBottomSheet,
              child: Text('showBottomSheet', style: TextStyle(fontSize: 16.0),),
            ),
            FlatButton(
              onPressed: _openShowModalBottomSheet,
              child: Text('showModalBottomSheet: $_choiceMBS', style: TextStyle(fontSize: 16.0),),
            )
          ],
        ),
      ),
    );
  }
}