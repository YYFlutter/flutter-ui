import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo_count.dart' as DemoCount;
import 'demo_extent.dart' as DemoExtent;
import 'demo_custom.dart' as DemoCustom;
import 'demo_builder.dart' as DemoBuilder;
import 'package:efox_flutter/utils/file.dart' as FileUtils;

String mdUrl = 'docs/widget/scrollview/gridview/index.md';
String codeUrl = 'docs/widget/scrollview/gridview/code.md';
String originCodeUrl = 'https://flutter.io/docs/cookbook/lists/grid-lists';

class Index extends StatefulWidget {
  static String name = 'GridView';
  static String routerName = 'gridview';

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
      loading: loading,
      modelChild: (context, child, model) {
        return [
          ___MD___,
        ];
      },
      demoChild: [
        DemoCount.Index(),
        DemoExtent.Index(),
        DemoCustom.Index(),
        DemoBuilder.Index(),
      ]
    );
  }
}
