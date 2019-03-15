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
  List mainAxisAlignment = [
    MainAxisAlignment.start,
    MainAxisAlignment.center,
    MainAxisAlignment.end,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly
  ];
  List mainValue1 = ['start', 'center', 'end'];
  List mainValue2 = ['Around', 'Between', 'Evenly'];
  int mainAxisAlignmentIndex = 0;

  List crossAxisAlignment = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.center,
    CrossAxisAlignment.end
  ];
  List crossValue1 = ['start', 'center', 'end'];
  int crossAxisAlignmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Demo'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: Text('修改mainAxisAligment的值'),
          ),
          Row(
            children: List.generate(3, (index) {
              return FlatButton(
                child: Text('${mainValue1[index]}'),
                onPressed: (){
                  setState(() {
                    mainAxisAlignmentIndex = index;
                  });
                },
              );
            })
          ),
          Row(
            children: List.generate(3, (index) {
              return FlatButton(
                child: Text('${mainValue2[index]}'),
                onPressed: (){
                  setState(() {
                    mainAxisAlignmentIndex = index + 3;
                  });
                },
              );
            })
          ),
          SizedBox(
            child: Text('修改crossAxisAlignment的值')
          ),
          Row(
            children: List.generate(3, (index) {
              return FlatButton(
                child: Text('${crossValue1[index]}'),
                onPressed: (){
                  setState(() {
                    crossAxisAlignmentIndex = index;
                  });
                },
              );
            })
          ),
          Container(
            width: double.infinity,
            height: 450.0,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: mainAxisAlignment[mainAxisAlignmentIndex],
              crossAxisAlignment: crossAxisAlignment[crossAxisAlignmentIndex],
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP6WANi6lLUbgVdbwxt0ADhbwPrpEa3IGMAOzgfBFMukYsmSKB',
                  width: 100.0,
                ),
                Image.network(
                  'http://pic.ffpic.com/files/2015/0321/0321ktbdbsjbzdq1.jpg',
                  width: 100.0,
                ),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzaRpH9hl6NsFdTw_c3CLTc9CCXcvH-Vo4HK8fb6asgQbaTMHJ',
                  width: 100.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}