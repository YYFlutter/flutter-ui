### GridView.count
```
import 'package:flutter/material.dart';
class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        reverse: false,
        scrollDirection: Axis.vertical,
        controller: ScrollController(
          initialScrollOffset: 0.0,
        ),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 2,
        physics: BouncingScrollPhysics(),
        primary: false,
        children: List.generate(25, (index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.redAccent,
              ),
            ),
            child: Center(
              child: Text('Item $index',
                  style: Theme.of(context).textTheme.headline),
            ),
          );
        }, growable: false),
      ),
    );
  }
}

```

### GridView.extent
```extent
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.extent'),
      ),
      body: GridView.extent(
        scrollDirection: Axis.vertical,
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        padding: EdgeInsets.all(10),
        children: List.generate(
          10,
          (index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.1,
                )
              ),
              child: Image.network('https://dianhu-1253537286.cos.eu-moscow.myqcloud.com/efoxfile/Moschat/ojbk.png'),
            );
          },
        ),
      ),
    );
  }
}

```

### GridView.custom
```flutter 
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

```

### GridView.builder
```flutter
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.builder'),
      ),
      body: GridView.builder(
        itemCount: 31,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 单行最大数量值
        ),
        itemBuilder: (context, index) {
          print('index $index');
          return Center(
            child: Text('index $index'),
          );
        },
      ),
    );
  }
}

```
