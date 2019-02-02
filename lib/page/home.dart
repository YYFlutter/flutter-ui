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

class _HomePageState extends State<HomePage>     with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _render(lang) {
    if (_selectedIndex == 1) {
      return Center(child: Text('1'));
    }
    return Center(
      child: ExpansionTile(
        title: Text(lang.t('widgetType.regularLayout')),
        leading: Icon(Icons.account_balance_wallet),
        backgroundColor: Colors.white12,
        children: <Widget>[
          ListTile(title: Text('list tile'), subtitle: Text('subtitle'))
        ],
        initiallyExpanded: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 实例化语言包
    AppTranslations lang = AppTranslations.of(context);
    // 实例化model
    // int age = STORE.get(context).userInfo.age;
    return STORE.connect(
      builder: (context, child, model) {
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
          body: _render(lang),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 36,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.subject,
                    size: 30,
                    color: Colors.lightGreen,
                  ),
                  title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    size: 30,
                    color: Colors.lightGreen,
                  ),
                  title: Text('Home')),
            ],
            currentIndex: _selectedIndex,
            fixedColor: Colors.lightGreen,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
