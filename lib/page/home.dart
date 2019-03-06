import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/application.dart';
import 'package:efox_flutter/lang/app_translations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtil;
import 'package:efox_flutter/store/store.dart' show Store;

import 'package:efox_flutter/components/header.dart' as Header;
import 'component/index.dart' as TabIndex;
import 'mine/index.dart' as MyIndex;

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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _bottomNavigationBar(model) {
    AppTranslations lang = AppTranslations.of(context);
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            title: Text(lang.t('title_component')),
            icon: Icon(Icons.dashboard)),
        BottomNavigationBarItem(
            title: Text(lang.t('title_my')), icon: Icon(Icons.person_outline)),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (int index) {
        _pageController.jumpToPage(index);
      },
    );
  }

  List<Widget> appBarActions(model) {
    return [
      PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
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
        return Scaffold(
          appBar: AppBar(
            title: Header.Index(lang.t('title'),),
            actions: appBarActions(model),
          ),
          bottomNavigationBar: _bottomNavigationBar(model),
          body: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: <Widget>[
              TabIndex.Index(model: model),
              MyIndex.Index(model: model),
            ],
          ),
        );
      },
    );
  }
}
