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
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon'),
      ),
      body: Center(
        child: Icon(
          Icons.android,
          size: 100.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
