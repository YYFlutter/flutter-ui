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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 300,
//                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    // A fixed-height child.
                    color: Colors.yellow,
                    height: 80.0,
                    width: viewportConstraints.maxWidth,
                    child: Text('外层定义一个ConstrainedBox，最小高度300。也可以通过LayoutBuilder拿到最大的宽高来定义滚动区域',),
                  ),
                  Container(
                    // Another fixed-height child.
                    color: Colors.green,
                    height: 80.0,
                    width: viewportConstraints.maxWidth,
                    child: Text('Container根据自定义的高度，加上MainAxisAlignment.spaceAround平均分布在300高的容器中。',),
                  ),
                  Container(
                    // Another fixed-height child.
                    color: Colors.blue,
                    height: 80.0,
                    width: viewportConstraints.maxWidth,
                    child: Text('当内容多时，会自动滚动',),
                  ),
                  Container(
                    // Another fixed-height child.
                    color: Colors.purple,
                    height: 80.0,
                    width: viewportConstraints.maxWidth,
                    child: Text('Container根据自定义的高度，加上MainAxisAlignment.spaceAround平均分布在300高的容器中。',),
                  ),
                  Container(
                    // Another fixed-height child.
                    color: Colors.indigo,
                    height: 80.0,
                    width: viewportConstraints.maxWidth,
                    child: Text('当内容多时，会自动滚动',),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
