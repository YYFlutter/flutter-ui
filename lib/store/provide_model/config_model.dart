import 'dart:convert';
import 'package:efox_flutter/config/index.dart' as Config;
import 'package:efox_flutter/utils/loadAsset.dart' show readRemoteFile;
import 'package:efox_flutter/utils/localstage.dart' show LocalStorage;
import 'package:package_info/package_info.dart' show PackageInfo;
import 'package:flutter/material.dart' show ChangeNotifier;

class ConfigInfo {
  bool isPro = Config.isPro;
  String version = '1.0';
  dynamic env = Config.env;
  String theme = 'red';
  String appVersion = '-';
}

ConfigInfo _appConfigInfo = new ConfigInfo();

class ConfigModel extends ChangeNotifier {
  get state => _appConfigInfo;

  Future getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appConfigInfo.appVersion = await packageInfo.version;
  }

  Future getTheme() async {
    String theme = await LocalStorage.get('theme');
    if (theme != null) {
      _appConfigInfo.theme = theme;
    }
  }

  dynamic getVersion() async {
    print('version ${_appConfigInfo.env.versionUrl}');
    String _version =
        await readRemoteFile(_appConfigInfo.env.versionUrl).then((resp) {
      Map<String, dynamic> res = json.decode(resp);
      return res['version'].toString() ?? '0.1';
    }).catchError((err) {
      print('err $err');
      return '0.0';
    });
    print('_version ${_version}');
    return _version;
  }

  methods(name, payload) async {
    print('payload= $payload');

    switch (name) {
      case 'setEnv':
        _appConfigInfo.isPro = payload;
        break;
      case 'setVersion':
        _appConfigInfo.version = await this.getVersion();
        break;
      case 'setTheme':
        _appConfigInfo.theme = payload;
        LocalStorage.set('theme', payload);
        break;
      case 'getTheme':
        await this.getTheme();
        break;
    }
  }
}
