import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/application.dart';
import 'package:efox_flutter/lang/app_translations.dart';
//
import 'package:efox_flutter/store/STORE.dart';

//
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 实例化语言包
    AppTranslations lang = AppTranslations.of(context);
    // 实例化model
    // int age = STORE.get(context).userInfo.age;
    return STORE.connect(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Text(lang.t('title')),
          actions: <Widget>[
            PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Color(0xffffffff),
                ),
                onSelected: (local) {
                  Application().onLocaleChanged(Locale(local));
                  print('local=$local');
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Row(
                          children: <Widget>[Text('中文')],
                        ),
                        value: 'zh',
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: <Widget>[Text('english')],
                        ),
                        value: 'en',
                      )
                    ])
          ],
        ),
        body: Center(
            child: ExpansionTile(
          title: Text(lang.t('widgetType.regularLayout')),
          leading: Icon(Icons.account_balance_wallet),
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(title: Text('list tile'), subtitle: Text('subtitle'))
          ],
          initiallyExpanded: true,
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: model.setAge,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
