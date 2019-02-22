import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/application.dart';
import 'package:efox_flutter/lang/app_translations.dart';
//
import 'package:efox_flutter/store/STORE.dart';

import 'component/index.dart' as TabIndex;
import 'mine/index.dart' as MyIndex;

class Index extends StatefulWidget {
  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget menu(MainStateModel model) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(model.theme.mainColor),
          ),
        ),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(model.theme.mainColor),
            ),
          ),
        ),
        labelColor: Color(model.theme.mainColor),
        unselectedLabelColor: Color(model.theme.thirdColor),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Color(model.theme.secondColor),
        labelStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        tabs: [
          Tab(
            text: AppTranslations.of(context).t('title_component'),
            icon: Icon(
              Icons.dashboard,
              size: 28,
            ),
          ),
          Tab(
            text: AppTranslations.of(context).t('title_my'),
            icon: Icon(
              Icons.person_outline,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> appBarActions(model) {
    return [
      PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: Color(model.theme.textColor),
        ),
        onSelected: (local) {
          Application().onLocaleChanged(Locale(local));
          print('local=$local');
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Text('中文'),
                  ],
                ),
                value: 'zh',
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Text('english'),
                  ],
                ),
                value: 'en',
              ),
            ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 实例化语言包
    AppTranslations lang = AppTranslations.of(context);
    return STORE.connect(
      builder: (context, child, model) {
        return DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(lang.t('title')),
              actions: appBarActions(model),
            ),
            bottomNavigationBar: menu(model),
            body: TabBarView(
              children: <Widget>[
                TabIndex.Index(model: model),
                MyIndex.Index(model: model),
              ],
            ),
          ),
        );
      },
    );
  }
}
