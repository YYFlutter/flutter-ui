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
    return Scrollable(
        axisDirection: AxisDirection.left,
        controller: ScrollController(),
        viewportBuilder: (context, offset) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                snap: false, // 当floating为true,当前才能为true，向下拉时，会自动显示flexibleSpace的内容
                pinned: false, // 当pinned为true时，一直显示标题，但不显示flexibleSpace的内容
                expandedHeight: 250.0,
                title: Text('floating=true'),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    '下拉时，显示标题头',
                    style: TextStyle(fontSize: 14),
                  ),
                  background: Image.network(
                    'http://h.hiphotos.baidu.com/image/h%3D300/sign=f0c08716c6fcc3ceabc0cf33a244d6b7/cefc1e178a82b901fd40c8077d8da9773912ef11.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                floating: true, // 当为true时，会先显示appbar再显示flexibleSpace的内容
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.teal[100 * (index % 9)],
                      child: Text('grid item $index'),
                    );
                  },
                  childCount: 10,
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
                  );
                }, childCount: 10),
              ),
            ],
          );
        });
  }
}
