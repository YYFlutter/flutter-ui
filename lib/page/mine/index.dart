import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/config/theme.dart' show AppTheme;
import 'package:efox_flutter/store/index.dart' show ConfigModel, Store;
import 'package:efox_flutter/config/color.dart' show materialColor;
import 'package:efox_flutter/utils/appVersion.dart' show AppVersion;
import 'package:efox_flutter/components/expansion_tile.dart' as Comp;

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
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
                title: Text(
                  '中文',
                ),
                onTap: () {
                  AppLocalizations.changeLanguage(Locale('zh'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('English'),
                onTap: () {
                  AppLocalizations.changeLanguage(Locale('en'));
                  Navigator.pop(context);
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
    List<Widget> _EdageList = [];
    materialColor.forEach((k, v) {
      _EdageList.add(this.Edage(k, v, context));
    });
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.$t('title_my'),
          ),
        ),
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
            Comp.ExpansionTile(
              leading: Icon(
                Icons.color_lens,
              ),
              headerBackgroundColor: Colors.transparent,
              title: Row(
                children: <Widget>[
                  Text(AppLocalizations.$t('common_mine_1.theme')),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                    child: Container(
                      color: Color(materialColor[
                          Store.value<ConfigModel>(context).theme]),
                      height: 15,
                      width: 15,
                    ),
                  )
                ],
              ),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: _EdageList,
                  ),
                )
              ],
            ),
            Divider(
              color: Color(AppTheme.lineColor),
            ),
            (Platform.isAndroid)
                ? ListTile(
                    onTap: () {
                      AppVersion().check(context, showTips: true);
                    },
                    leading: Icon(Icons.history),
                    title: Text(AppLocalizations.$t('common_mine_1.version')),
                    trailing: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(Store.value<ConfigModel>(context).appVersion),
                          Icon(Icons.navigate_next)
                        ],
                      ),
                    ))
                : Container(),
            (Platform.isAndroid)
                ? Divider(
                    color: Color(AppTheme.lineColor),
                  )
                : Container(),
          ],
        ));
  }

  Widget Edage(name, color, context) {
    return GestureDetector(
      onTap: () {
        Store.value<ConfigModel>(context).$setTheme(name);
      },
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
