/**
 * auth: linhaoran
 * Email: 1476589247@qq.com
 */
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expand'),),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: 150.0,
            height: 150.0
          ),
          child: Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Hello World',
              style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)
            ),
          ),
        ),
      ),
    );
  }
}