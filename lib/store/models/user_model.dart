import 'package:scoped_model/scoped_model.dart';
import '../objects/user_info.dart';

mixin UserModel on Model {
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
