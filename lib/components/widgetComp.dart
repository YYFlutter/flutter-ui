import 'package:flutter/material.dart';
import 'package:efox_flutter/store/STORE.dart';

class WidgetComp extends StatelessWidget {
  final dynamic modelChild;
  final String title;

  WidgetComp({Key key, this.title, @required this.modelChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return STORE.connect(builder: (context, child, model) {
      List _list = this.modelChild(context, child, model);
      List<Widget> _bodyList = [];
      _list.forEach((item) {
        _bodyList.add(item);
      });
      return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          shrinkWrap: true,
          children: _bodyList,
        ),
      );
    });
  }
}
