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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row Expanded'),),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP6WANi6lLUbgVdbwxt0ADhbwPrpEa3IGMAOzgfBFMukYsmSKB',
                fit: BoxFit.cover,)
          ),
          Expanded(
            flex: 2,
            child: Image.network(
              'http://pic.ffpic.com/files/2015/0321/0321ktbdbsjbzdq1.jpg',
              fit: BoxFit.cover,)
          ),
          Expanded(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzaRpH9hl6NsFdTw_c3CLTc9CCXcvH-Vo4HK8fb6asgQbaTMHJ',
              fit: BoxFit.cover,)
          ),
        ],
      ),
    );
  }
}