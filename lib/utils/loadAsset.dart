import 'package:flutter/services.dart' show rootBundle;
import 'package:efox_flutter/http/index.dart' as Http;

Future<String> readLocaleFile(path) async {
  return await rootBundle.loadString('${path}', cache: false);
}

Future<String> readRemoteFile(path) async {
  return await Http.get(url: path);
}
