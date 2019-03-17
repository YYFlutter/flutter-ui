/**
 * auth: linhaoran
 * Email: 1476589247@qq.com
 */
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container Demo'),),
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              child: Text('Hello', style: TextStyle(fontSize: 20.0),),
              width: 80.0,
              height: 80.0,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              // color: const Color(0xfff48Fb1),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xfff48Fb1),
                border: Border.all(width: 2.0, color: Colors.redAccent),
                borderRadius: BorderRadius.circular(10.0)
              ),
            ),
          ),
          Center(
            child: Container(
              child: Text(
                'Hello World',
                style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black),
              ),
              // width: 200.0,
              // height: 200.0,
              // color: Colors.green,
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.red),
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                image: DecorationImage(
                  image: NetworkImage('http://sucimg.itc.cn/avatarimg/55d21fdc4b8d4838bef0da94ada78cab_1501139484387'),
                  centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  // fit: BoxFit.cover
                )
              ),
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0
              ),
//              foregroundDecoration: BoxDecoration(
//                image: DecorationImage(
//                  image: NetworkImage('https://www.example.com/images/frame.png'),
//                  centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//                )
//              ),
              transform: Matrix4.rotationZ(0.1),
            ),
          )
        ],
      )
    );
  }
}