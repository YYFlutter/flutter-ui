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
 var height = 360.0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LayoutBuilder'),),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              this.setState(() {
                height == 360.0 ? height = 200.0 : height = 360.0;
              });
            },
            child: Text('父视口高度: $height', style: TextStyle(fontSize: 16.0),),
          ),
          Container(
            width: double.infinity,
            height: height,
            color: Colors.blueGrey,
            margin: EdgeInsets.only(top: 10.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: viewportConstraints.maxHeight),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: Image.network('http://pic1.win4000.com/wallpaper/2019-02-15/5c664c3e1d90c.jpg', fit: BoxFit.cover,),
                          height: 120,
                          width: double.infinity,
                        ),
                        Container(
                          child: Image.network('http://pic1.win4000.com/wallpaper/2019-02-15/5c664c48c73d0.jpg', fit: BoxFit.cover,),
                          height: 160,
                          width: double.infinity,
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
          )
        ],
      )
    );
  }
}
