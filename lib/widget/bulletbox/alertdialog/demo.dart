import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  List Action = ['Ok', 'Cancel'];
  String _choice = 'Nothing';

  Future _openAlertDialog () async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,  // user must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
          actions: List.generate(2, (index) {
            return FlatButton(
              child: Text('${Action[index]}',style: TextStyle(color: Theme.of(context).primaryColor),),
              onPressed: (){
                Navigator.pop(context, Action[index]);
              },
            );
          }),
        );
      }
    );
    switch (action) {
      case 'Ok':
        setState(() {
          _choice = 'Ok';
        });
        break;
      case 'Cancel':
        setState(() {
          _choice = 'Cancel';
        });
        break;
      default:
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlertDialog'),),
      body: Center(
        child: Text('你的选择是：$_choice'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAlertDialog,
        child: Icon(Icons.camera_enhance, color: Colors.white, size: 30.0,),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}