import 'package:flutter/material.dart';
import 'package:efox_flutter/store/STORE.dart';
import 'package:efox_flutter/components/markdownComp.dart';

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
        if (item.runtimeType == String) {
          _bodyList.add(MarkDownComp(item));
        } else {
          _bodyList.add(item);
        }
      });
      return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
          shrinkWrap: true,
          children: _bodyList,
        ),
      );
    });
  }
}
