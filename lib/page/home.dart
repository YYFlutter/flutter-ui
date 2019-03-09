import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/app_translations.dart' show AppTranslations;
import 'package:efox_flutter/store/index.dart' show Store;

import 'package:efox_flutter/controller/index.dart' as Controller;

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
    print('init===');
    Controller.initState();
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

  @override
  Widget build(BuildContext context) {
    return Store.connect(
      builder: (context, child, model) {
        return Scaffold(
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
