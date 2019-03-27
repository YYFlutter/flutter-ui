import 'package:efox_flutter/store/index.dart' show Store, ConfigModel, UserModel;

void initState() {
  // 获取版本号
  Store.valueNotCtx<ConfigModel>().$getAppVersion();
  // 登录
  Store.valueNotCtx<UserModel>().$getUserInfo();
}