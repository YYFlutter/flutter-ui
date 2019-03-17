/**
 * auth: linhaoran
 * Email: 1476589247@qq.com
 */
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column Expanded'),),
      body: Container(
        width: double.infinity,
        height: 450.0,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP6WANi6lLUbgVdbwxt0ADhbwPrpEa3IGMAOzgfBFMukYsmSKB',
                width: 100.0, fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.network(
                'http://pic.ffpic.com/files/2015/0321/0321ktbdbsjbzdq1.jpg',
                width: 100.0, fit: BoxFit.cover,
            ),
            ),
            Expanded(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzaRpH9hl6NsFdTw_c3CLTc9CCXcvH-Vo4HK8fb6asgQbaTMHJ',
                width: 100.0, fit: BoxFit.cover,
              ),
            ),
            
          ],
        ),
      )
    );
  }
}