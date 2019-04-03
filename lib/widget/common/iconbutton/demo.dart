import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List data = [58273,58275,59493,57903,58283,58284,57771,58285];
  int index = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IconButton'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: ListView(
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              icon: Icon(IconData(
                data[index],
                fontFamily: 'MaterialIcons',
                matchTextDirection: true
              )),
              color: Theme.of(context).primaryColor,
              highlightColor: Colors.black12,
              splashColor: Theme.of(context).primaryColorLight,
              onPressed: (){
                if (index < 7) {
                  this.setState(() {
                    index = index + 1;
                  });
                } else {
                  this.setState(() {
                    index = 0;
                  });
                }
              },
              tooltip: '长按文本提示',
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              icon: Icon(Icons.sync_disabled),
              color: Theme.of(context).primaryColor,
              highlightColor: Colors.black12,
              splashColor: Theme.of(context).primaryColorLight,
              tooltip: '长按文本提示',
              disabledColor: Colors.grey
            )
          ],
        ),
      )
    );
  }
}
