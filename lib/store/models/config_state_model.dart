import 'package:efox_flutter/config/index.dart' as Config;

class ConfigInfo {
  bool isPro = Config.isPro;
  dynamic env = Config.env;
}

ConfigInfo _appConfigInfo = new ConfigInfo();

class ConfigModel {
  get state => _appConfigInfo;

  methods(name, payload) {
    print('payload= $payload');

    switch (name) {
      case 'setEnv':
        _appConfigInfo.isPro = !_appConfigInfo.isPro;
        break;
    }
  }
}
