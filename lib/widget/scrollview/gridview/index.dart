import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetLodingComp.dart';
import 'package:efox_flutter/utils/file.dart' as FileUtils;

String _mdUrl = 'docs/widget/scrollview/gridview/index.md';

class Demo extends StatefulWidget {
  static String name = 'GridView';
  static String routerName = 'gridview';
  static String codeUrl = 'https://github.com/efoxTeam/flutter-ui/blob/master/readme.md';
  static String mdUrl = _mdUrl;

  @override
  _DemoState createState() => new _DemoState();
}

class _DemoState extends State<Demo> {
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
    return WidgetComp(
      name: Demo.name,
      codeUrl: Demo.codeUrl,
      mdUrl: Demo.mdUrl,
      loading: loading,
      modelChild: (context, child, model) {
        return [
          ___MD___,
          Container(
            color: Colors.teal.shade700,
            alignment: Alignment.center,
            child: Text(
              'Hello WorldHello WorldHello  WorldHello WorldHello World',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.white),
            ),
          ),
        ];
      },
    );
  }
}
