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
  var direction = Axis.horizontal;
  var directionValue = 'horizontal';
  var verticalDirection = VerticalDirection.down;
  var verticalDirectionValue = 'down';
  var spacing = 10.0;
  var runSpacing = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wrap'),),
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: Text('点击下面值查看变化'),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('direction:$directionValue', style: TextStyle(fontSize: 11.0),),
                onPressed: (){
                  setState(() {
                    direction == Axis.horizontal ? direction = Axis.vertical : direction = Axis.horizontal;
                    directionValue == 'horizontal' ? directionValue = 'vertical' : directionValue = 'horizontal';
                  });
                },
              ),
              FlatButton(
                child: Text('verticalDirection:$verticalDirectionValue', style: TextStyle(fontSize: 11.0),),
                onPressed: (){
                  setState(() {
                    verticalDirection == VerticalDirection.up ? verticalDirection = VerticalDirection.down : verticalDirection = VerticalDirection.up;
                    verticalDirectionValue == 'up' ? verticalDirectionValue = 'down' : verticalDirectionValue = 'up';
                  });
                },
              ),
              FlatButton(
                child: Text('spacing:$spacing', style: TextStyle(fontSize: 13.0),),
                onPressed: (){
                  setState(() {
                    spacing == 10 ? spacing = 15 : spacing = 10;
                  });
                },
              ),
              FlatButton(
                child: Text('runSpacing:$runSpacing', style: TextStyle(fontSize: 13.0),),
                onPressed: (){
                  setState(() {
                    runSpacing == 10 ? runSpacing = 15 : runSpacing = 10;
                  });
                },
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 200,
            color: Theme.of(context).primaryColor,
            child: Wrap(
              direction: direction,
              alignment: WrapAlignment.center,
              spacing: spacing,
              runAlignment: WrapAlignment.center,
              runSpacing: runSpacing,
              crossAxisAlignment: WrapCrossAlignment.start,
              textDirection: TextDirection.ltr,
              verticalDirection: verticalDirection,
              children: List.generate(7, (index) {
                return Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text('E', style: TextStyle(fontSize: 20.0),),
                  ),
                  label: Text('Efox$index'),
                );
              })
            ),
          )
        ],
      )
    );
  }
}