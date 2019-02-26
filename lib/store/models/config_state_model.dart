import 'package:scoped_model/scoped_model.dart';
import 'package:efox_flutter/config/index.dart' as Config;

class ConfigInfo {
  bool isPro = Config.isPro;
  dynamic config = Config.env;
}
mixin ConfigModel on Model {
  ConfigInfo _appConfigInfo = new ConfigInfo();
  get configInfo => _appConfigInfo;
}