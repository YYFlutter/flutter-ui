import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(),
            Text(
              '在Scaffold的bottomNavigationBar属性，增加BottomNavigationBar组件，实现底部导航栏。',
              textAlign: TextAlign.center,
            ),
            Divider(),
            Text(
              '属性children通过BottomNavigationBarItem定义。',
              textAlign: TextAlign.center,
            ),
            Divider(),
            Text(
              'BottomNavigationBar能通过onTap增加点击事件',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        fixedColor: Colors.purple,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            title: Text(
              '导航一',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            icon: Icon(
              Icons.play_circle_filled,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              '导航二',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            icon: Icon(
              Icons.pause_circle_filled,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              '导航三',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            icon: Icon(Icons.cloud_circle,
              color: Colors.blue,),
          ),
        ],
      ),
    );
  }
}
