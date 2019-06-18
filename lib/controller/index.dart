import 'package:efox_flutter/store/index.dart'
    show Store, ConfigModel, UserModel;

import 'package:efox_flutter/utils/appVersion.dart' show AppVersion;

void initState() async {
  // 获取版本号
  Store.valueNotCtx<ConfigModel>().$getAppVersion();
  // 登录
  Store.valueNotCtx<UserModel>().getLocalUserInfo().then((res) {
    if (res) {
      Store.valueNotCtx<UserModel>().getUserStar();
    }
  });
  Store.valueNotCtx<UserModel>().getFlutterUIStar();
  Future.delayed(Duration(seconds: 3), () {
    AppVersion().check(Store.widgetCtx);
  });
}
