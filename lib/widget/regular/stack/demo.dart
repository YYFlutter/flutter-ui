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
  int alignmentIndex = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar'),),
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: Text('修改alignment的值,non-positined节点会改变位置'),
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(9, (index) {
              return FlatButton(
                child: Text('${alignment[index]}', style: TextStyle(fontSize: 11.0),),
                onPressed: (){
                  setState(() {
                    alignmentIndex = index;
                  });
                },
              );
            }),
          ),
          StackDemo(alignmentValue: alignment[alignmentIndex],)
        ],
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  final Alignment alignmentValue;
  StackDemo({Key key, @required this.alignmentValue}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      fit: StackFit.loose,
      overflow: Overflow.clip,
      alignment: alignmentValue,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16/9,
          child: Image.network(
            'http://pic1.win4000.com/wallpaper/2019-01-31/5c52bf7fdc959_270_185.jpg',
            fit: BoxFit.cover
          ),
        ),
        Positioned(
          top: 32.0,
          left: 32.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Flutter',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Efox Team',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.redAccent
                ),
              )
            ],
          ),
        ),
        SizedBox(
          child: Icon(Icons.ac_unit, color: Theme.of(context).primaryColor, size: 32.0,),
        )
      ]
    );
  }
}