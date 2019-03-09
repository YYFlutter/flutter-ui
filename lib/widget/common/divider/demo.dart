import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var padding = 10.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Divider'),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            child: Text('padding：$padding'),
            onPressed: (){
              setState(() {
                padding == 10.0 ? padding = 30.0 : padding = 10.0;
              });
            },
          ),
          Container(
            padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
            child: Divider(
              color: Theme.of(context).primaryColor,
              height: 22.0,
              indent: 0.0,
            ),
          ),
        ], 
      ),
    );
  }
}
