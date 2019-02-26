import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'package:efox_flutter/utils/file.dart' as FileUtils;

String originCodeUrl = '';
String codeUrl = 'docs/widget/regular/align/code.md';
String mdUrl = 'docs/widget/regular/align/index.md';

class Index extends StatefulWidget {
  static String name = 'Align';
  static String routerName = 'align';

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool loading = true;
  String ___MD___ = mdUrl;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      this.initMd();
    }

  initMd () async {
    String mdStr = await FileUtils.readLocaleFile(___MD___);
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
      demoChild: <Widget>[],
    );
  }
}