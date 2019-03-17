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
  var aspectRatio = 1.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AspectRatio'),),
      body: ListView(
        children: <Widget>[
          Container(
            // margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Image.network(
                'http://pic1.win4000.com/wallpaper/2019-01-31/5c52bf7fdc959_270_185.jpg',
                fit: BoxFit.cover,
              ),
            )
          ),
          FlatButton(
            child: Text('宽度沾满，aspectRatio: $aspectRatio', style: TextStyle(fontSize: 16.0),),
            onPressed: (){
              setState(() {
                aspectRatio == 1.5 ? aspectRatio = 2.0 : aspectRatio = 1.5;
              });
            },
          )
        ],
      )
    );
  }
}