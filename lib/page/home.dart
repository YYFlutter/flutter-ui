import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/controller/index.dart' as Controller;
import 'package:efox_flutter/config/theme.dart' show AppTheme;
import 'component/tabs.dart' as TabIndex;
import 'mine/index.dart' as MyIndex;
import 'app_login/index.dart' as LoginIndex;

import 'package:efox_flutter/store/index.dart' show Store, UserModel;

class Index extends StatefulWidget {
  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Controller.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            title: Text(AppLocalizations.$t('title_component')),
            icon: Icon(Icons.dashboard)),
        BottomNavigationBarItem(
            title: Text(AppLocalizations.$t('title_my')),
            icon: Icon(Icons.person_outline)),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (int index) {
        _pageController.jumpToPage(index);
      },
    );
  }

  List<Widget> renderTiles(id) {
    if (id != null) {
      return [
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text(AppLocalizations.$t('common.logout')),
          onTap: () {
            Store.value<UserModel>(context).$clearUserInfo();
          },
        )
      ];
    }
    return [
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(AppLocalizations.$t('common.login')),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return LoginIndex.Index();
              },
            ),
          );
        },
      )
    ];
  }

  /**
   * 抽屉面板
   */
  renderDrawer() {
    print('renderDrawer $context');
    return Drawer(
      child: Store.connect<UserModel>(builder: (context, child, model) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color(AppTheme.mainColor),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ClipOval(
                      child: model.user.avatar_url != null
                          ? Image.network(
                              model.user.avatar_url,
                              width: 80,
                            )
                          : Icon(Icons.account_box),
                    ),
                  ),
                  Text(
                    model.user.name ?? 'Guest',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: renderTiles(model.user.node_id),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Store.setWidgetCtx(context); // 初始化scaffold的上下文作为全局上下文，提供弹窗等使用。
    return Scaffold(
      drawer: renderDrawer(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          TabIndex.Index(),
          MyIndex.Index(),
        ],
      ),
    );
  }
}
