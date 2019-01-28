import 'package:flutter/material.dart';
//语言包实例化
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:efox_flutter/lang/Application.dart';
import 'package:efox_flutter/lang/AppTranslationsDelegate.dart';
//引用Store 层
import 'package:efox_flutter/store/STORE.dart';
//模块加载
import 'package:efox_flutter/page/HomePage.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  //实例化 model
  final model = MainStateModel();
  // 定义全局 语言代理
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    //实例化多语言
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    super.initState();
  }

  // 切换语言方法
  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return STORE.init(
        model: model,
        child: MaterialApp(
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            print(
                'deviceLocale=$deviceLocale supportedLocales=$supportedLocales');
            return deviceLocale ?? Locale('en');
          },
          localizationsDelegates: [
            _newLocaleDelegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'),
            const Locale('zh'),
          ],
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ));
  }
}
