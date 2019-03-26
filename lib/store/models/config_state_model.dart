import 'dart:convert';
import 'package:efox_flutter/config/index.dart' as Config;
import 'package:efox_flutter/utils/loadAsset.dart' show readRemoteFile;
import 'package:efox_flutter/utils/localstage.dart' show LocalStorage;
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
  Future getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = await packageInfo.version;
  }

  Future getTheme() async {
    String _theme = await LocalStorage.get('theme');
    print('config get Theme ${_theme}');
    if (_theme != null) {
      setTheme(_theme);
    }
  }

  Future setTheme(payload) async {
    theme = payload;
    LocalStorage.set('theme', payload);
    notifyListeners();
  }

  dynamic getVersion() async {
    print('==================get version ===== ${this.env.versionUrl}');
    String _version =
        await readRemoteFile(this.env.versionUrl).then((resp) {
      Map<String, dynamic> res = json.decode(resp);
      return res['version'].toString() ?? '0.1';
    }).catchError((err) {
      print('err $err');
      return '0.0';
    });
    print('_version ${_version}');
    return _version;
  }

  Future setVersion() async {
    version = await this.getVersion();
    notifyListeners();
  }
}
