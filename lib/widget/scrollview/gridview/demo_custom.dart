import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.costom'),
      ),
      body: GridView.custom(
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 10, // 单行最大10个元素布局
//          ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100, // 单列最大宽度100
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              child: Text('$index'),
            );
          },
          // 滚动时回调函数
          semanticIndexCallback: (widget, index) {
              print('index $index');
              return index;
          },
        ),
        // 数量滚滚动限制，类似GridView.count
//        childrenDelegate: SliverChildListDelegate(
//          List.generate(30, (index) {
//            return Container(
//              child: Text('index $index'),
//            );
//          }),
//        ),
      ),
    );
  }
}
