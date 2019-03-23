import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  final String text;
  Index(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
          //color: Theme.of(context).primaryTextTheme.title.color
          ),
    );
  }
}
