import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'package:efox_flutter/utils/file.dart' as FileUtils;
import 'demo.dart' as Demo;

String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Padding-class.html';
String codeUrl = 'docs/widget/regular/padding/code.md';
String mdUrl = 'docs/widget/regular/padding/index.md';

class Index extends StatefulWidget {
  static String name = 'Padding';
  static String routerName = 'padding';

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
  
  initMd() async {
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
      demoChild: <Widget>[
        Demo.Index()
      ],
    );
  }
}