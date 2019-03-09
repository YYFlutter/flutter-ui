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
        title: Text('Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Text(
                '文本使用了TextAlign.end',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.redAccent
                ),
              ),
            ),
            Text(
              '文本设置maxLines：2，overflow：TextOverflow.ellipsis,文本最多显示两行，超过两行以省略号方式处理',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
