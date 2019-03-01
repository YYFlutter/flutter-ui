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
      body: Scrollable(
        viewportBuilder: (context, offset) {
          return Scrollable(
            axisDirection: AxisDirection.right,
            viewportBuilder: (context, offset) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(20, (index) {
                    return RaisedButton(
                      child: Text('index $index'),
                      onPressed: () {
                        print('$offset');
                      },
                    );
                  }),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
