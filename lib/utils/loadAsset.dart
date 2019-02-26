import 'package:dio/dio.dart';
import 'package:efox_flutter/store/STORE.dart' as Store;
import 'file.dart' as FileUtil;

Future<String> loadMarkdownAssets(path) async {
  if (!Store.model.config.state.isPro) {
    return FileUtil.readLocaleFile(path);
  }
  String url = Store.model.config.state.env.GithubMarkdownOrigin + path;
  return Dio().get(url).then((res) {
    return res.data;
  });
}
