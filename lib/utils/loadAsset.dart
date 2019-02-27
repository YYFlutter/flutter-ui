import 'package:efox_flutter/store/store.dart' as Store;
import 'package:efox_flutter/store/http.dart' as Http;
import 'file.dart' as FileUtil;

Future<dynamic> loadMarkdownAssets(path) async {
  if (!Store.model.config.state.isPro) {
    return FileUtil.readLocaleFile(path);
  }
  String url = Store.model.config.state.env.GithubMarkdownOrigin + path;
  return Http.get(url).then((res) {
    return res;
  });
}
