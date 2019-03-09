import 'package:flutter/material.dart';

//语言包实例化
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:efox_flutter/lang/index.dart'
    show AppLocalizationsDelegate, AppLocalizations;
import 'package:efox_flutter/lang/config.dart' show ConfigLanguage;

//引用Store 层
import 'package:efox_flutter/store/index.dart' show model, Store;

//路由
import 'package:efox_flutter/router/index.dart' show FluroRouter;

//主题
import 'package:efox_flutter/config/theme.dart' show AppTheme;

//统计
import 'package:efox_flutter/utils/analytics.dart' as Analytics;

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  MainApp() {
    FluroRouter.initRouter();
  }

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  // 定义全局 语言代理
  AppLocalizationsDelegate _delegate;

  @override
  void initState() {
    //实例化多语言
    super.initState();
    _delegate = AppLocalizationsDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return Store.init(
      model: model,
      child: MaterialApp(
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          print(
              'deviceLocale=$deviceLocale supportedLocales=$supportedLocales');
          Locale _locale = supportedLocales.contains(deviceLocale)
              ? deviceLocale
              : Locale('en');
          return _locale;
        },
        onGenerateTitle: (context) {
          // 设置多语言代理
          AppLocalizations.setProxy(setState, _delegate);
          return '-';
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          _delegate,
        ],
        supportedLocales: ConfigLanguage.supportedLocales,
//        title: 'Flutter Demo',
        theme: AppTheme.themData,
        onGenerateRoute: FluroRouter.router.generator,
        navigatorObservers: <NavigatorObserver>[Analytics.observer],
      ),
    );
  }
}
