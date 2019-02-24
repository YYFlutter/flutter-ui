### Row
```
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
  int mainAxisAlignmentIndex = 0;
  List crossAxisAlignment = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.center,
    CrossAxisAlignment.end
  ];
  int crossAxisAlignmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Demo'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            // height: 100.0,
            child: Text('修改mainAxisAligment的值'),
          ),
          Row(
            children: <Widget>[
             FlatButton(
                child: Text('start'),
                onPressed: (){
                  setState(() {
                    mainAxisAlignmentIndex = 0;
                  });
                },
              ),
             FlatButton(
                child: Text('center'),
                onPressed: (){
                  setState(() {
                    mainAxisAlignmentIndex = 1;
                  });
                },
              ),
              FlatButton(
                child: Text('end'),
                onPressed: (){
                  setState(() {
                    mainAxisAlignmentIndex = 2;
                  });
                },
              )
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Around'),
                onPressed: (){
                  setState(() {
                    mainAxisAlignmentIndex = 3;
                  });
                },
              ),
              FlatButton(
                child: Text('Between'),
                onPressed: (){
                  setState(() {
                    mainAxisAlignmentIndex = 4;
                  });
                },
              ),
              FlatButton(
                child: Text('Evenly'),
                onPressed: (){
                  setState(() {
                    mainAxisAlignmentIndex = 5;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            child: Text('修改crossAxisAlignment的值')
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('start'),
                onPressed: (){
                  setState(() {
                    crossAxisAlignmentIndex = 0;
                  });
                },
              ),
              FlatButton(
                child: Text('center'),
                onPressed: (){
                  setState(() {
                    crossAxisAlignmentIndex = 1;
                  });
                },
              ),
              FlatButton(
                child: Text('end'),
                onPressed: (){
                  setState(() {
                    crossAxisAlignmentIndex = 2;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: mainAxisAlignment[mainAxisAlignmentIndex],
            crossAxisAlignment: crossAxisAlignment[crossAxisAlignmentIndex],
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP6WANi6lLUbgVdbwxt0ADhbwPrpEa3IGMAOzgfBFMukYsmSKB',
                width: 80.0,  fit: BoxFit.cover,),
              Image.network(
                'http://pic.ffpic.com/files/2015/0321/0321ktbdbsjbzdq1.jpg',
                width: 80.0, height: 180.0, fit: BoxFit.cover,),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzaRpH9hl6NsFdTw_c3CLTc9CCXcvH-Vo4HK8fb6asgQbaTMHJ',
                width: 80.0, height: 100.0, fit: BoxFit.cover,)
            ],
          )
        ],
      )
    );
  }
}

```

### Row.Extend
```
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row Extend'),),
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
```