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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView'),
      ),
      body: Column(
        children: <Widget>[
          Divider(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.blue,
              ),
            ),
            height: 100,
            child: SingleChildScrollView(
              child: Text(
                '这里是高度100，增加SingleChildScrollView, 内容超过时可滚动。这里是高度100，增加SingleChildScrollView, 内容超过时可滚动。这里是高度100，增加SingleChildScrollView, 内容超过时可滚动。这里是高度100，增加SingleChildScrollView, 内容超过时可滚动。',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Divider(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.blue,
              ),
            ),
            height: 100,
            child: Text(
              '这里是高度100，没有滚动时，内容会超过100边界，这里是高度100，没有滚动时，内容会超过100边界，这里是高度100，没有滚动时，内容会超过100边界，这里是高度100，没有滚动时，内容会超过100边界，这里是高度100，没有滚动时，内容会超过100边界',
            ),
          ),
        ],
      ),
    );
  }
}
