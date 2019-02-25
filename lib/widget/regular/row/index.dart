import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo.dart' as Demo;
import 'demo_expanded.dart' as DemoExpanded;
import 'package:efox_flutter/utils/file.dart' as FileUtils;

String _mdUrl = 'docs/widget/regular/row/index.md';

class Index extends StatefulWidget {
  static String name = 'Row';
  static String routerName = 'row';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/widgets/Row-class.html';
  static String codeUrl = 'docs/widget/regular/row/code.md';
  static String mdUrl = _mdUrl;

  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  bool loading = true;
  String ___MD___ = _mdUrl;

  @override
  void initState() {
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
      codeUrl: Index.codeUrl,
      originCodeUrl: Index.originCodeUrl,
      mdUrl: Index.mdUrl,
      loading: loading,
      modelChild: (context, child, model) {
        return [
          ___MD___,
        ];
      },
      demoChild: [
        Demo.Index(),
        DemoExpanded.Index()
      ]
    );
  }
}
