import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //语言包实例化
import 'package:efox_flutter/lang/index.dart'
    show AppLocalizationsDelegate, AppLocalizations;
import 'package:efox_flutter/lang/config.dart' show ConfigLanguage;
import 'package:efox_flutter/store/index.dart'
    show Store, ConfigModel; //引用Store 层
import 'package:efox_flutter/router/index.dart' show FluroRouter; //路由
import 'package:efox_flutter/config/theme.dart' show AppTheme; //主题
import 'package:efox_flutter/utils/analytics.dart' as Analytics; //统计

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
    Store.setStoreCtx(context); // 初始化数据层
  }

  @override
  Widget build(BuildContext context) {
    Store.value<ConfigModel>(context).$getTheme();

    return Store.connect<ConfigModel>(
      builder: (context, child, model) {
        return MaterialApp(
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            print(
                'deviceLocale=$deviceLocale supportedLocales=$supportedLocales');
            Locale _locale = supportedLocales.contains(deviceLocale)
                ? deviceLocale
                : Locale('zh');
            return _locale;
          },
          onGenerateTitle: (ctx) {
            // 设置多语言代理
            AppLocalizations.setProxy(setState, _delegate);
            return 'flutter';
          },
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            _delegate,
          ],
          supportedLocales: ConfigLanguage.supportedLocales,
          theme: AppTheme.getThemeData(model.theme),
          onGenerateRoute: FluroRouter.router.generator,
          navigatorObservers: <NavigatorObserver>[Analytics.observer],
        );
      },
    );
  }
}

void main() => runApp(Store.init(child: MainApp()));
