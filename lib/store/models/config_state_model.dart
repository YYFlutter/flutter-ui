import 'package:efox_flutter/config/index.dart' as Config;
import 'package:efox_flutter/utils/localStorage.dart' show LocalStorage;
import 'package:package_info/package_info.dart' show PackageInfo;
import 'package:flutter/foundation.dart' show ChangeNotifier;

class ConfigInfo {
  bool isPro = Config.isPro;
  String version = '1.0';
  dynamic env = Config.env;
  String theme = 'red';
  String appVersion = '-';
}

class ConfigModel extends ConfigInfo with ChangeNotifier {
  Future $getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = await packageInfo.version;
    notifyListeners();
  }

  Future $getTheme() async {
    String _theme = await LocalStorage.get('theme');
    print('config get Theme ${_theme}');
    if (_theme != null) {
      $setTheme(_theme);
    }
  }

  Future $setTheme(payload) async {
    theme = payload;
    LocalStorage.set('theme', payload);
    notifyListeners();
  }

}
