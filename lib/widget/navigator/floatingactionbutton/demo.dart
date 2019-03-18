import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click FloatingActionButton to add Count',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'count: $count',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        tooltip: '长按后的提示',
        foregroundColor:Colors.blue, // 该颜色被Icon覆盖
        backgroundColor: Colors.red, // 背景填充色
        elevation: 10, // 下阴影大小
        highlightElevation: 50, // 阴影扩散范围
        mini: true,
        child: Icon(
          Icons.notifications_active,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),
    );
  }
}
