import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  List Option = ['A', 'B', 'C'];
  String _choose = 'Nothing';

  Future _openSimpleDialog () async {
    final option = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('SimpleDialog'),
          titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          contentPadding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
          children: List.generate(3, (index) {
            return SimpleDialogOption(
              child: Text('Option ${Option[index]}'),
              onPressed: (){
                Navigator.pop(context, Option[index]);
              },
            );
          }),
        );
      }
    );
    switch (option) {
      case "A":
        setState(() {
          _choose = 'A';
        });
        break;
      case "B":
        setState(() {
          _choose = 'B';
        });
        break;
      case "C":
        setState(() {
          _choose = 'C';
        });
        break;
      default:
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SimpleDialog'),),
      body: Center(
        child: Text('你的选择是：$_choose')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openSimpleDialog,
        child: Icon(Icons.branding_watermark, color: Colors.white, size: 30.0,),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}