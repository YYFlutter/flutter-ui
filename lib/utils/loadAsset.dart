import 'package:efox_flutter/store/http.dart' show RestApi;
import 'file.dart' as FileUtil;

Future<String> localeFile (path, isLocale) async {
  if (isLocale) {
    return FileUtil.readLocaleFile(path);
  }
  return RestApi.get(path);
}