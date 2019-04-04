import 'package:efox_flutter/store/objects/user_info.dart' show UserInfo;
const user = {
  "id": 123,
  "plan": {
    'name': '123'
  }
};

testLogin () {
  UserInfo _user = UserInfo.fromJson(user);
  print('_user $_user');
  print('_user ${_user.plan.name}');
}