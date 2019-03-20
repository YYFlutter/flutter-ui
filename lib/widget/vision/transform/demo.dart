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
        title: Text('Transform'),
      ),
      body: Transform(
        alignment: Alignment.center,
        transform: Matrix4.skewY(0.1),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: const Color(0xFFE8581C),
          child: const Text('Apartment for rent!'),
        ),
      ),
    );
  }
}
