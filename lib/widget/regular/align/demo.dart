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
  List alignment = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight
  ];
  List alignmentValue1 = ['topLeft', 'topCenter', 'topRight'];
  List alignmentValue2 = ['centerLeft', 'center', 'centerRight'];
  List alignmentValue3 = ['bottomLeft', 'bottomCenter', 'bottomRight'];
  int alignmentIndex = 0;
  String showText = 'topLeft';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Align Demo'),),
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: Text('修改alignment的值'),
          ),
          Row(
            children: List.generate(3, (index) {
              return FlatButton(
                child: Text('${alignmentValue1[index]}', style: TextStyle(fontSize: 12.0),),
                onPressed: (){
                  setState(() {
                    alignmentIndex = index;
                    showText = alignmentValue1[index];
                  });
                },
              );
            }),
          ),
          Row(
            children: List.generate(3, (index) {
              return FlatButton(
                child: Text('${alignmentValue2[index]}', style: TextStyle(fontSize: 12.0),),
                onPressed: (){
                  setState(() {
                    alignmentIndex = index + 3;
                    showText = alignmentValue2[index];
                  });
                },
              );
            }),
          ),
          Row(
            children: List.generate(3, (index) {
              return FlatButton(
                child: Text('${alignmentValue3[index]}', style: TextStyle(fontSize: 11.0),),
                onPressed: (){
                  setState(() {
                    alignmentIndex = index + 6;
                    showText = alignmentValue3[index];
                  });
                },
              );
            }),
          ),
          Center(
            child: Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://wx3.sinaimg.cn/large/006bllTKly1fmvmfjfn6pj30v90v9785.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Align(
                widthFactor: 1,
                heightFactor: 1,
                alignment: alignment[alignmentIndex],
                child: Text(
                  '$showText',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}