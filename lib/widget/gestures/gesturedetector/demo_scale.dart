import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart' show RandomContainer;

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  double _width = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: RandomContainer(
          changeOnRedraw: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("手势操作图片放大或缩小"),
              Divider(
                height: 10,
              ),
              GestureDetector(
                child: Image.network(
                  'https://avatars3.githubusercontent.com/u/15372930?s=460&v=4',
                  fit: BoxFit.contain,
                  width: _width,
                ),
                onScaleStart: (ScaleStartDetails ev) {
                  print('ScaleStartDetails $ev');
                },
                onScaleUpdate: (ScaleUpdateDetails ev) {
                  print("$ev");
                  setState(() {
                    _width = 200 * ev.scale.clamp(.8, 10.0);
                  });
                },
                onScaleEnd: (ScaleEndDetails ev) {
                  print('ScaleEndDetails $ev');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
