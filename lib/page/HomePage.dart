import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/Application.dart';
import 'package:efox_flutter/lang/AppTranslations.dart';
//
import 'package:efox_flutter/store/STORE.dart';

//
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 实例化语言包
    AppTranslations lang = AppTranslations.of(context);
    // 实例化model
    // int age = STORE.get(context).userInfo.age;
    return STORE.connect(builder: (context, child, model) {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                model.userInfo.age.toString(),
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: model.setAge,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
