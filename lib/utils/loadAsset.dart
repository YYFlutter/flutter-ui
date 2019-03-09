import 'package:efox_flutter/store/index.dart' show model;
import 'package:efox_flutter/store/http.dart' as Http;
import 'file.dart' as FileUtil;

Future<dynamic> loadMarkdownAssets(path) async {
  if (!model.config.state.isPro) {
    return FileUtil.readLocaleFile(path);
  }
  String url = model.config.state.env.githubMarkdownOrigin + path + '?v=${model.config.state.version}';
  return Http.get(url).then((res) {
    return res;
  });
}


Future<dynamic> loadAssets(path) async {
  return Http.get(path).then((res) {
    return res;
  });
}

