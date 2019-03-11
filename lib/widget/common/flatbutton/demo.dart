import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlatButton'),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              child: Text('默认按钮'),
              onPressed: (){},
              textColor: Theme.of(context).primaryColor,
              color: Colors.blueGrey,
              highlightColor: Colors.blueAccent,
            ),
            FlatButton(
              child: Text('默认按钮'),
              textColor: Theme.of(context).primaryColor,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.brown,
              onPressed: (){},
            ),
            FlatButton.icon(
              icon: Icon(Icons.android,size: 26.0,color: Colors.blueAccent),
              label: Text('默认按钮'),
              onPressed: (){},
            ),
            FlatButton.icon(
              icon: Icon(Icons.account_balance,size: 26.0,color: Colors.greenAccent),
              label: Text('默认按钮'),
              disabledColor: Colors.grey,
              disabledTextColor: Colors.brown,
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
