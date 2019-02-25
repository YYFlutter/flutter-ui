import 'package:scoped_model/scoped_model.dart';
import 'package:efox_flutter/config/index.dart' as Config;

class ConfigInfo {
  bool isPro = Config.isPro;
  String origin = 'https://github.com/efoxTeam/flutter-ui/blob/master/docs/widget/scrollview/gridview/code.md';
  String assetOrigin = 'https://github.com/efoxTeam/flutter-ui/blob/master/';
}
mixin ConfigModel on Model {
  get configInfo => ConfigInfo();
}