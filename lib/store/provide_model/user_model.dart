import 'package:flutter/material.dart';
import '../objects/user_info.dart';

class UserModel extends ChangeNotifier {
  UserInfo _userInfo = UserInfo();
  get userInfo => _userInfo;

  Future getAction() async {
    _userInfo.loading = true;
    notifyListeners();
  }

  void setAge() {
    _userInfo.age += 1;
    notifyListeners();
  }
}
