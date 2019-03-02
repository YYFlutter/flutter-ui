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
        title: Text('Scrollable实现滚动'),
      ),
      body: Scrollable(
        axisDirection: AxisDirection.right,
        viewportBuilder: (context, offset) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                20,
                (index) {
                  return RaisedButton(
                    child: Text('index $index'),
                    onPressed: () {
                      print('$offset');
                    },
                  );
                },
              ).toList(),
            ),
          );
        },
      ),
    );
  }
}
