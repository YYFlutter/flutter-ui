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
  var maxWidth = 200.0;
  var maxHeight = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox'),),
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: Text('修改maxWidth maxHeight 值'),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('maxWidth: $maxWidth', style: TextStyle(fontSize: 14.0),),
                onPressed: (){
                  setState(() {
                    maxWidth == 200.0 ? maxWidth = 150.0 : maxWidth = 200.0;
                  });
                },
              ),
              FlatButton(
                child: Text('maxHeight: $maxHeight', style: TextStyle(fontSize: 14.0),),
                onPressed: (){
                  setState(() {
                    maxHeight == 200.0 ? maxHeight = 150.0 : maxHeight = 200.0;
                  });
                },
              )
            ],
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100.0,
                minHeight: 100.0,
                maxWidth: maxWidth,
                maxHeight: maxHeight
              ),
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('http://sucimg.itc.cn/avatarimg/55d21fdc4b8d4838bef0da94ada78cab_1501139484387')
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}