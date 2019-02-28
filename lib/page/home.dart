import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/application.dart';
import 'package:efox_flutter/lang/app_translations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//
import 'package:efox_flutter/store/store.dart' show Store, MainStateModel;

import 'package:efox_flutter/components/header.dart' as Header;
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
            width: .1,
            color: Color(model.theme.greyColor),
          ),
        ),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: .2,
              color: Color(model.theme.mainColor),
            ),
          ),
        ),
        labelColor: Color(model.theme.mainColor),
        unselectedLabelColor: Color(model.theme.greyColor),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Color(model.theme.secondColor),
        labelStyle: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
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
          // color: Color(model.theme.textColor),
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
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // 实例化语言包
    AppTranslations lang = AppTranslations.of(context);
    return Store.connect(
      builder: (context, child, model) {
        return DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Header.Index(lang.t('title')),
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
