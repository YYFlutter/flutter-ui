import 'package:scoped_model/scoped_model.dart';
import '../objects/UserInfo.dart';

class UserModel extends Model {
  UserInfo _userInfo = UserInfo();
  get userInfo => _userInfo;

  Future getAction() async {
    _userInfo.loading = true;
    notifyListeners();
  }

  Function setAge() {
    //_userInfo.age += 1;
    _userInfo.age += 1;
    notifyListeners();
  }
}
