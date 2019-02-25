import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'package:efox_flutter/utils/file.dart' as FileUitls;
import 'demo.dart' as Demo;

String originCodeUrl = '';
String codeUrl = '';
String mdUrl = 'docs/widget/regular/column/index.md';

class Index extends StatefulWidget {
  static String name = 'Column';
  static String routerName = 'coloumn';

  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  bool loading = true;
  String ___MD___ = mdUrl;

  @override
  void initState() {
    super.initState();
    this.initMd();
  }

  initMd() async {
    String mdStr = await FileUitls.readLocaleFile(___MD___);
    setState(() {
      this.___MD___ = mdStr;
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WidgetComp.Index(
      name: Index.name,
      codeUrl: codeUrl,
      originCodeUrl: originCodeUrl,
      mdUrl: mdUrl,
      modelChild: (context, child, model) {
        return [
          ___MD___
        ];
      },
      demoChild: <Widget>[
        Demo.Index()
      ],
    );
  }
}