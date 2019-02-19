import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart';
import 'package:efox_flutter/store/http.dart';
import 'intro.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => new _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  String mdList = '';
  @override
  void initState() {
    super.initState();
    this.initMd ();
  }
  initMd () async {
    dynamic res = await RestApi.get('https://wanwusangzhi.github.io/WebStudy/readme.md');
    setState(() {
      this.mdList = res.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return WidgetComp(
      title: 'GridViewDemo',
      modelChild: (context, child, model) {
        return [
          md_01,
          mdList,
          Container(
            color: Colors.teal.shade700,
            alignment: Alignment.center,
            child: Text('Hello WorldHello WorldHello  WorldHello WorldHello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
          ),
        ];
      },
    );
  }
}
