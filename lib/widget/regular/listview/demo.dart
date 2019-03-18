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
  List listview = [
    'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c3e1d90c.jpg',
    'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c40f3bc2.jpg',
    'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c4406144.jpg',
    'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c46823f8.jpg',
    'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c48c73d0.jpg',
    'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c4b4dc2f.jpg',
    'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c51a2a45.jpg',
    'http://pic1.win4000.com/wallpaper/2019-02-14/5c65107a0ee05.jpg',
    'http://pic1.win4000.com/wallpaper/2019-02-14/5c65108043791.jpg',
    'http://pic1.win4000.com/wallpaper/2019-02-14/5c651084373de.jpg'
  ];
  var scrollDirections = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView'),),
      body: ListView(
        scrollDirection: scrollDirections,
        reverse: false,
        controller: ScrollController(
          keepScrollOffset: true
        ),
        primary: false,
        physics: ScrollPhysics(),
        shrinkWrap: false,
        padding: EdgeInsets.all(20.0),
        itemExtent: 200,
        children: List.generate(10, (index) {
          return InkWell(
            onTap: () {
              this.setState(() {
                scrollDirections = Axis.vertical == scrollDirections ? Axis.horizontal : Axis.vertical;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(listview[index]),
                  fit: BoxFit.cover
                ),
              ),
            ),
          ); 
        }),
      ),
    );
  }
}