import 'package:efox_flutter/store/http.dart' show RestApi;
import 'file.dart' as FileUtil;

Future<String> loadMarkdownAssets(path, productionEnv) async {
  if (productionEnv) {
    return await RestApi.get(path).then((res) {
      return 'res';
    });
    // return await RestApi.get(path);
  }
  return FileUtil.readLocaleFile(path);
}
