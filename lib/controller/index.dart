import 'package:efox_flutter/store/index.dart'
    show Store, ConfigModel, UserModel;

import 'package:efox_flutter/utils/appVersion.dart' show AppVersion;

void initState() async {
  // 获取版本号
  Store.value<ConfigModel>().getAppVersion();
  // 登录
  /*Store.value<UserModel>().getLocalUserInfo().then((res) {
    if (res) {
      Store.value<UserModel>().getUserStar();
    }
  });*/
  // Store.value<UserModel>().getFlutterUIStar();
  Future.delayed(Duration(seconds: 3), () {
    AppVersion().check(Store.context);
  });
}
