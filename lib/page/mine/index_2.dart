import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/router/index.dart' show FluroRouter;
import 'package:efox_flutter/config/theme.dart' show AppTheme;

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
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
        body: ListView(
          children: <Widget>[
            ListTile(
                onTap: () => this.openLanguageSelectMenu(),
                leading: Icon(Icons.language),
                title: Text(AppLocalizations.$t('common_mine_1.language')),
                trailing: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(AppLocalizations.languageCode),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                )),
            Divider(
              color: Color(AppTheme.lineColor),
            ),
            ExpansionTile(
              title: Text(AppLocalizations.$t('common_mine_1.theme')),
              children: <Widget>[
                Wrap(
                  //crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.spaceEvenly,
                  runAlignment: WrapAlignment.spaceEvenly,
                  children: <Widget>[
                    this.Edage(AppTheme.yellow),
                    this.Edage(AppTheme.blue),
                    this.Edage(AppTheme.orange),
                    this.Edage(AppTheme.lightGreen),
                    this.Edage(AppTheme.red),
                  ],
                )
              ],
            )
          ],
        ));
  }

  Widget Edage(color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Color(color),
        height: 30,
        width: 30,
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
