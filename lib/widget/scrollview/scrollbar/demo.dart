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
        title: Text('Scrollbar'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 100,
          // ),
          itemCount: 20,
          itemExtent: 50, // 行高
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(' $index 滚动时显示滚动条'),
            );
          },
        ),
      ),
    );
  }
}
