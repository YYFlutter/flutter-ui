import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/router/index.dart' show FluroRouter;
import 'package:efox_flutter/config/theme.dart' show AppTheme;

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
  }

  List<dynamic> _getList() {
    return [
      {
        'name': AppLocalizations.$t('common_mine_1.language'),
        'icon': 59540, // language
        'index': 0
      },
      {
        'name': AppLocalizations.$t('common_mine_1.environment'),
        'icon': 57539, // import_export
        'index': 1,
      },
      {
        'name': AppLocalizations.$t('common_mine_1.compProgress'),
        'icon': 57709, // low_priority
        'index': 2
      }
    ];
  }

  actionsEvent(int index) {
    print('index $index');
    switch (index) {
      case 0:
        this.openLanguageSelectMenu();
        break;
      case 1:
        this.openEnvSelectMenu();
        break;
      case 2:
        FluroRouter.router.navigateTo(
          context,
          '/webview?url=${Uri.encodeComponent(widget.model.config.state.env.githubWeb)}&title=${Uri.encodeComponent(AppLocalizations.$t('common.compProgress'))}',
        );
        break;
    }
  }

  void pop([message]) {
    Navigator.pop(context);
    if (message != null) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(message),
      ));
    }
  }

  /**
   * 国际化
   */
  void openLanguageSelectMenu() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.label_outline),
                title: Text(
                  AppLocalizations.$t('common_mine_1.cn'),
                ),
                onTap: () {
                  AppLocalizations.changeLanguage(Locale('zh'));
                  this.pop(AppLocalizations.$t('common_mine_1.success'));
                },
              ),
              ListTile(
                leading: Icon(Icons.label_outline),
                title: Text(AppLocalizations.$t('common_mine_1.en')),
                onTap: () {
                  AppLocalizations.changeLanguage(Locale('en'));
                  this.pop(AppLocalizations.$t('common_mine_1.success'));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /**
   * 环境选择
   */
  void openEnvSelectMenu() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.label_outline),
                title: Text(
                  AppLocalizations.$t('mine.loadNetwork'),
                ),
                onTap: () {
                  widget.model.dispatch('config', 'setEnv', true);
                  this.pop(AppLocalizations.$t('common_mine_1.success'));
                },
              ),
              ListTile(
                leading: Icon(Icons.label_outline),
                title: Text(AppLocalizations.$t('mine.loadLocal')),
                onTap: () {
                  widget.model.dispatch('config', 'setEnv', false);
                  this.pop(AppLocalizations.$t('common_mine_1.success'));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.$t('nav_title_1')),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _getList().length * 2,
        itemBuilder: (context, index) {
          double _index = index / 2;
          if (index % 2 == 0) {
            dynamic item = _getList()[_index.toInt()];
            return ListTile(
              onTap: () {
                actionsEvent(item['index']);
              },
              leading: Icon(
                IconData(
                  item['icon'],
                  fontFamily: 'MaterialIcons',
                  matchTextDirection: true,
                ),
              ),
              title: Text(item['name']),
            );
          } else {
            return Divider(
              color: Color(AppTheme.lineColor),
            );
          }
        },
      ),
    );
    /* return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              ),
              color: Colors.red,
            ),
            height: 240,
            child: Stack(
              alignment: const FractionalOffset(0.8, 0.8),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.network(
                      'https://raw.githubusercontent.com/efoxTeam/flutter-ui/master/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Hello Guest',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _getList().length * 2,
            itemBuilder: (context, index) {
              double _index = index / 2;
              if (index % 2 == 0) {
                dynamic item = _getList()[_index.toInt()];
                return ListTile(
                  onTap: () {
                    actionsEvent(item['index']);
                  },
                  leading: Icon(
                    IconData(
                      item['icon'],
                      fontFamily: 'MaterialIcons',
                      matchTextDirection: true,
                    ),
                  ),
                  title: Text(item['name']),
                );
              } else {
                return Divider(
                  color: Color(AppTheme.lineColor),
                );
              }
            },
          ),
        ],
      ),
    ); */
  }
}

class Index extends StatefulWidget {
  final dynamic model;

  Index({Key key, this.model}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}
