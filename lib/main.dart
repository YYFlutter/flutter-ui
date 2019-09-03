import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //语言包实例化
import 'package:efox_flutter/lang/index.dart'
    show AppLocalizationsDelegate, AppLocalizations;
import 'package:efox_flutter/lang/config.dart' show ConfigLanguage;
import 'package:efox_flutter/store/index.dart'; //引用Store 层
import 'package:efox_flutter/router/index.dart' show FluroRouter; //路由
import 'package:efox_flutter/config/theme.dart' show AppTheme; //主题
import 'package:efox_flutter/utils/analytics.dart' as Analytics; //统计
import 'package:oktoast/oktoast.dart' show OKToast;
import 'package:efox_flutter/page/home.dart' as HomePage;

// import './mock/index.dart' as TestCase;
class MainApp extends StatefulWidget {
  MainApp() {
    FluroRouter.initRouter();
    // TestCase.runTestCase();
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

    Future.delayed(Duration.zero, () async {
      Store.value<ConfigModel>().getTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    Store.of(context);
    return Consumer<ConfigModel>(
      builder: (context, configModel, child) {
        return MaterialApp(
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            print(
                'deviceLocale=$deviceLocale supportedLocales=$supportedLocales context=$context');
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
          theme: AppTheme.getThemeData(configModel.theme),
          onGenerateRoute: FluroRouter.router.generator,
          // home:  HomePage.Index(),
          navigatorObservers: <NavigatorObserver>[Analytics.observer],
        );
      },
    );
  }
}

void main() => runApp(
      OKToast(
        child: Store.init(
          child: MainApp(),
        ),
      ),
    );
