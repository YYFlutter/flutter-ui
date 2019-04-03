import 'package:efox_flutter/store/index.dart'
    show Store, ConfigModel, UserModel;

import 'package:efox_flutter/utils/appVersion.dart' show AppVersion;

void initState() {
  // 获取版本号
  Store.valueNotCtx<ConfigModel>().$getAppVersion();
  // Store.valueNotCtx<UserModel>().$getUserInfo();
  // 登录
  Store.valueNotCtx<UserModel>().$getLocalUserInfo();
  Future.delayed(Duration(seconds: 3), () {
    AppVersion().check(Store.widgetCtx);
  });
}
