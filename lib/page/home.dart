import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/application.dart';
import 'package:efox_flutter/lang/app_translations.dart';
//
import 'package:efox_flutter/store/STORE.dart';

//
import 'tabbar/index.dart';

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
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.deepOrange,
          ),
        ),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.deepOrange,
            ),
          ),
        ),
        labelColor: Colors.deepOrange,
        unselectedLabelColor: Colors.orangeAccent,
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
              ],
            ),
            bottomNavigationBar: menu(),
            body: TabBarView(
              children: <Widget>[
                ComponentsPage(),
                Center(
                  child: new GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this would produce 2 rows.
                    crossAxisCount: 3,
                    // Generate 100 Widgets that display their index in the List
                    children: new List.generate(10, (index) {
                      return new Center(
                        child: new Text(
                          'Item $index',
                          style: Theme.of(context).textTheme.headline,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
