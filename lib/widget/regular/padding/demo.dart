/**
 * auth: linhaoran
 * Email: 1476589247@qq.com
 */
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Padding Demo'),),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.lightBlue,
              alignment: Alignment.center,
              child: Text(
                'Hello World',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            )
          ),
        )
      ),
    );
  }
}