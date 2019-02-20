import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetLodingComp.dart';
import 'package:efox_flutter/utils/file.dart' as FileUtils;

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => new _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  static String routerName = 'scrollview_gridview';
  bool loading = true;
  String ___MD___01 = 'docs/widget/scrollview/gridview/index.md';
  @override
  void initState() {
    super.initState();
    this.initMd();
  }

  initMd() async {
    String mdStr = await FileUtils.readLocaleFile(___MD___01);
    setState(() {
      this.___MD___01 = mdStr;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetComp(
      title: 'GridViewDemo',
      codeUrl: 'https://github.com/efoxTeam/flutter-ui/blob/master/readme.md',
      loading: loading,
      modelChild: (context, child, model) {
        return [
          ___MD___01,
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
