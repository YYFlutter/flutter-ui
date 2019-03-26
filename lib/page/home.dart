import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/controller/index.dart' as Controller;
import 'package:efox_flutter/config/theme.dart' show AppTheme;
import 'component/tabs.dart' as TabIndex;
import 'mine/index.dart' as MyIndex;
import 'app-login/index.dart' as LoginIndex;

import 'package:efox_flutter/utils/appVersion.dart' show AppVersion;

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
    print('==============home context $context');
    AppVersion().check(context);
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
        // TODO
        // Controller.initState();
        _pageController.jumpToPage(index);
      },
    );
  }

  renderDrawer() {
    return Drawer(
      child: Column(
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
                    child: Image.asset(
                      "assets/imgs/avatar.png",
                      width: 80,
                    ),
                  ),
                ),
                Text(
                  'Guest',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(AppLocalizations.$t('common.login')),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return LoginIndex.Index();
                    }));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
