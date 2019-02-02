import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/application.dart';
import 'package:efox_flutter/lang/app_translations.dart';
//
import 'package:efox_flutter/store/STORE.dart';

//

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget menu() {
    return Container(
      color: Colors.white12,
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black26,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(
            text: "Components",
            icon: Icon(
              Icons.dashboard,
              size: 28,
            ),
          ),
          Tab(
            text: "My",
            icon: Icon(
              Icons.account_circle,
              size: 28,
            ),
          ),
        ],
      ),
    );
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
              backgroundColor: Colors.black87,
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
                        ),
                      ],
                )
              ],
            ),
            bottomNavigationBar: menu(),
            body: TabBarView(
              children: <Widget>[
                Center(
                  child: ExpansionTile(
                    title: Text(lang.t('widgetType.regularLayout')),
                    leading: Icon(Icons.account_balance_wallet),
                    backgroundColor: Colors.white12,
                    children: <Widget>[
                      ListTile(
                          title: Text('list tile'), subtitle: Text('subtitle'))
                    ],
                    initiallyExpanded: true,
                  ),
                ),
                Center(
                  child: ExpansionTile(
                    title: Text(lang.t('widgetType.regularLayout')),
                    leading: Icon(Icons.account_balance_wallet),
                    backgroundColor: Colors.white12,
                    children: <Widget>[
                      ListTile(
                          title: Text('list tile'), subtitle: Text('subtitle'))
                    ],
                    initiallyExpanded: true,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
