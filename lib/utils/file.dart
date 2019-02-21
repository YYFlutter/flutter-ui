import 'package:flutter/services.dart' show rootBundle;

Future<String> readLocaleFile (path) async {
  String content = await rootBundle.loadString('${path}', cache: false);
  return content;
}