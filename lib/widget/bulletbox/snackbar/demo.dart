import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SnackBar'),),
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            return FlatButton(
              child: Text('Open SnackBar'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('I am SnackBar....'),
                    backgroundColor: Theme.of(context).primaryColor,
                    action: SnackBarAction(
                      textColor: Colors.white,
                      label: '撤销',
                      onPressed: (){
                      },
                    ),
                    duration: Duration(seconds: 2)
                  )
                );
              },
            );
          },
        )
      ),
    );
  }
}