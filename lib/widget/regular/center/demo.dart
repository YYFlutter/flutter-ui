/**
 * auth: linhaoran
 * Email: 1476589247@qq.com
 */
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var heightFactor = 2.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Center Demo'),),
      body: Column(
        children: <Widget>[
          Center(
            heightFactor: heightFactor,
            widthFactor: double.infinity,
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('http://sucimg.itc.cn/avatarimg/55d21fdc4b8d4838bef0da94ada78cab_1501139484387')
                )
              ),
            ),
          ),
          FlatButton(
            child: Text('heightFactor: $heightFactor', style: TextStyle(fontSize: 20.0),),
            onPressed: (){
              setState(() {
                heightFactor == 1.0 ? heightFactor = 2.0 : heightFactor = 1.0;
              });
            },
          )
        ],
      )
    );
  }
}
