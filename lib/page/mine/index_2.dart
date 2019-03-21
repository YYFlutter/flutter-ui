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
    ];
  }

  actionsEvent(int index) {
    print('index $index');
    switch (index) {
      case 0:
        this.openLanguageSelectMenu();
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
                //leading: Icon(Icons.label_outline),
                title: Text(
                  AppLocalizations.$t('common_mine_1.cn'),
                ),
                onTap: () {
                  AppLocalizations.changeLanguage(Locale('zh'));
                  this.pop(AppLocalizations.$t('common_mine_1.success'));
                },
              ),
              ListTile(
                //leading: Icon(Icons.label_outline),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(AppLocalizations.$t('nav_title_1'))),
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
  }
}

class Index extends StatefulWidget {
  final dynamic model;

  Index({Key key, this.model}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}
