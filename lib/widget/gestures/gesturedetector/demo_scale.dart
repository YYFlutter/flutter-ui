import 'package:flutter/material.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/imgs/avatar.png'),
              Text("手势操作图片放大或缩小"),
              GestureDetector(
                child: Image.asset('assets/imgs/avatar.png',
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
    );
  }
}
