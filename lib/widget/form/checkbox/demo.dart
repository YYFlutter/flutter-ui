import 'package:flutter/material.dart';
import 'dart:math';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<bool> checkBoxValue = [false, true, true, false, true];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkbox'),),
      body: Center(
        child: Wrap(
          children: List.generate(5, (index) {
            Color color = _randomColor();
            return Checkbox(
              value: checkBoxValue[index],
              activeColor: color,
              tristate: false,
              onChanged: (value) {
                setState(() {
                  checkBoxValue[index] = value;
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

Color _randomColor () {
  var red = Random.secure().nextInt(255);
  var green = Random.secure().nextInt(255);
  var blue = Random.secure().nextInt(255);
  return Color.fromARGB(255, red, green, blue);
}