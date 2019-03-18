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
  List fit = [
    BoxFit.contain,
    BoxFit.cover,
    BoxFit.fill,
    BoxFit.fitHeight,
    BoxFit.fitWidth,
    BoxFit.none,
    BoxFit.scaleDown
  ];
  List fitValue1 = ['contain', 'cover', 'fill'];
  List fitValue2 = ['fitHeight', 'fitWidth'];
  List fitValue3 = ['none', 'scaleDown'];
  int fitIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FittedBox Demo'),),
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: Text('修改fit的值'),
          ),
          Row(
            children: List.generate(3, (index) {
              return FlatButton(
                child: Text(fitValue1[index]),
                onPressed: (){
                  setState(() {
                    fitIndex = index;
                  });
                },
              );
            }),
          ),
          Row(
            children: List.generate(2, (index) {
              return FlatButton(
                child: Text(fitValue2[index]),
                onPressed: (){
                  setState(() {
                    fitIndex = index + 3;
                  });
                },
              );
            }),
          ),
          Row(
            children: List.generate(2, (index) {
              return FlatButton(
                child: Text(fitValue3[index]),
                onPressed: (){
                  setState(() {
                    fitIndex = index + 5;
                  });
                },
              );
            }),
          ),
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
                  });
                },
              );
            }),
          ),
          Center(
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Color(0xfff8bbd0),
              // color: Theme.of(context).primaryColor,
              constraints: BoxConstraints(
                maxWidth: 200.0
              ),
              margin: const EdgeInsets.all(10.0),
              child: FittedBox(
                fit: fit[fitIndex],
                alignment: alignment[alignmentIndex],
                child: Container(
                  color: Color(0xfff48fb1),
                  child: Text('FittedBox', style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}