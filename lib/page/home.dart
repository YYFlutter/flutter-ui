import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/controller/index.dart' as Controller;
import 'package:efox_flutter/config/theme.dart' show AppTheme;
import 'component/tabs.dart' as TabIndex;
import 'mine/index.dart' as MyIndex;
import 'app_login/index.dart' as LoginIndex;
import 'comment/index.dart' as CommentIndex;
import 'library/index.dart' as LibraryIndex;

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
    return BottomAppBar(
      elevation: 0,
      color: Color(0xFFf7f7f7),
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        //backgroundColor: Color(0xff000000),
        elevation: 0,
        backgroundColor: Color(0xFFf7f7f7),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text(AppLocalizations.$t('title_library')),
              icon: Icon(Icons.library_add)),
          BottomNavigationBarItem(
              title: Text(AppLocalizations.$t('title_component')),
              icon: Icon(Icons.dashboard)),
          BottomNavigationBarItem(
              title: Text(AppLocalizations.$t('title_comment')),
              icon: Icon(Icons.comment)),
          BottomNavigationBarItem(
              title: Text(AppLocalizations.$t('title_my')),
              icon: Icon(Icons.person_outline)),
        ],
        // type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index == 1 && _currentIndex != index) {
            Store.value<UserModel>(context).getIssueFlutterUI();
          }
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  /**
   * 左侧列表
   */
  List<Widget> renderTiles(id) {
    if (id != null) {
      return [
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text(AppLocalizations.$t('common.logout')),
          onTap: () {
            Store.value<UserModel>(context).clearUserInfo();
            Store.value<UserModel>(context).changeIsStar(false);
          },
        ),
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
                children: renderTiles(model.user.id),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _floatingActionButton(context) {
    return Store.connect<UserModel>(builder: (context, child, model) {
      return FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          if (!model.isStar && model.user.id != null) {
            print('进行star');
            model.setStarFlutterUI();
          } else {
            print('不满足进行star条件');
            if (model.user.id == null) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return LoginIndex.Index();
              }));
            } else {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('已star'),
              ));
            }
          }
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              model.isStar
                  ? Icon(Icons.star, size: 20, color: Colors.white)
                  : Icon(Icons.star_border, size: 20, color: Colors.white),
              Text('${model.flutter_ui_info.stargazersCount.toString()}',
                  style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Store.setWidgetCtx(context); // 初始化scaffold的上下文作为全局上下文，提供弹窗等使用。
    return Scaffold(
      drawer: renderDrawer(),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingActionButton(context),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          LibraryIndex.Index(),
          TabIndex.Index(),
          CommentIndex.Index(),
          MyIndex.Index(),
        ],
      ),
    );
  }
}
