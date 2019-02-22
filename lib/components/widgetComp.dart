import 'package:flutter/material.dart';
import 'package:efox_flutter/store/STORE.dart';
import 'package:efox_flutter/components/markdownComp.dart' as MarkDownComp;
import 'package:efox_flutter/lang/app_translations.dart';
import 'package:efox_flutter/components/baseComp.dart' as BaseComp;
import 'package:efox_flutter/components/exampleComp.dart' as ExampleComp;
import 'package:efox_flutter/utils/file.dart' as FileUtils;
import 'package:efox_flutter/router/index.dart' show FluroRouter;

class Index extends StatelessWidget {
  final List<Widget> _bodyList = [];
  final dynamic modelChild;
  final List<Widget> demoChild;
  final String codeUrl;
  final String mdUrl;
  final String name;
  final bool loading;

  Index({
    Key key,
    this.name,
    @required this.modelChild,
    this.demoChild,
    this.loading,
    this.codeUrl,
    this.mdUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return STORE.connect(builder: (context, child, model) {
      _bodyList.length = 0;
      List _list = this.modelChild(context, child, model);
      _list.forEach((item) {
        if (item.runtimeType == String) {
          _bodyList.add(MarkDownComp.Index(item));
        } else {
          _bodyList.add(item);
        }
      });
      // 增加
      if (this.demoChild != null) {
        this.demoChild.forEach((Widget item) {
          _bodyList.add(ExampleComp.Index(child: item));
        });
      }

      return Scaffold(
        appBar: AppBar(
          title: Text(this.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
              ),
              onPressed: () async {
                String mdStr = await FileUtils.readLocaleFile(this.mdUrl);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return BaseComp.Index(
                      title: this.name,
                      child: (context, child, model) {
                        return MarkDownComp.Index(mdStr);
                      }
                    );
                  }
                ));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.code,
              ),
              onPressed: () async {
                FluroRouter.router.navigateTo(context,
                    '/webview?url=${Uri.encodeComponent(this.codeUrl)}');
              },
            ),
            PopupMenuButton(
              onSelected: (index) {
                print('index ${index.runtimeType}');
                if (index == 0) {
                  FluroRouter.router.navigateTo(context,
                      '/webview?url=${Uri.encodeComponent('https://github.com/efoxTeam/flutter-ui')}');
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Row(children: [
                      Icon(
                        Icons.swap_horiz,
                      ),
                      Text('官网'),
                    ]),
                    value: 0,
                  ),
                ];
              },
            ),
          ],
        ),
        body: this.renderWidget(context),
      );
    });
  }

  Widget renderWidget(BuildContext context) {
    var _loading = this.loading;
    if (_loading != null && _loading) {
      return Center(
        child: Stack(
          children: <Widget>[
            // 遮罩
            Opacity(
              opacity: .8,
              child: ModalBarrier(
                color: Colors.black87,
              ),
            ),
            // 居中显示
            Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                      child: Text(
                        AppTranslations.of(context).t('loading'),
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    // 加载完成后返回页面
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: this._bodyList,
      ),
    );
  }
}
