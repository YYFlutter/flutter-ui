import 'package:flutter/material.dart';

class ExampleComp extends StatelessWidget {
  final Widget child;

  ExampleComp({Key key, this.child}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.0,
      margin: EdgeInsets.fromLTRB(50, 40, 50, 40),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.deepOrange,
          width: 1.0
        ),
      ),
      child: this.child,
    );
  }
}