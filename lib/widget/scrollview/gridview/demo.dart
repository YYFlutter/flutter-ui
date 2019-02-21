import 'package:flutter/material.dart';
import 'dart:math';
class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _value = Random().nextInt(60);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview ${_value} items'),
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
        children: List.generate(_value, (index) {
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
