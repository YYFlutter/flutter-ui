/**
 * auth: linhaoran
 * Email: 1476589247@qq.com
 */
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  final List listview = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListBody'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ListBody(
            mainAxis: Axis.vertical,
            reverse: false,
            children: List.generate(10, (index) {
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(listview[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
