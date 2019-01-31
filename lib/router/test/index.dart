import 'package:flutter/widgets.dart';

import 'package:efox_flutter/page/test/test_page_one.dart';
import 'package:efox_flutter/page/test/test_page_two.dart';

Map<String, WidgetBuilder> getTestRoutesConfig(BuildContext context) {
  return {
    '/test/test_page_one': (context) => TestPageOne(),
    '/test/test_page_two': (context) => TestPageTwo()
  };
}
