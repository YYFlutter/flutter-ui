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