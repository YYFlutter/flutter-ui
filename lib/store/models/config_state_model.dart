import 'package:scoped_model/scoped_model.dart';

class ConfigInfo {
  bool isPro = false;
  String origin = 'https://github.com/efoxTeam/flutter-ui/blob/master/docs/widget/scrollview/gridview/code.md';
  String assetOrigin = 'https://github.com/efoxTeam/flutter-ui/blob/master/';
}
mixin ConfigModel on Model {
  get configInfo => ConfigInfo();
}