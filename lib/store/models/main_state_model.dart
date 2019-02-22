import 'package:scoped_model/scoped_model.dart';
import 'user_model.dart' show UserModel;
import 'theme_model.dart' show AppThemeModel;
import 'config_state_model.dart' show ConfigModel;

///主数据模型，需要全局使用的数据在这里添加模型
class MainStateModel extends Model with UserModel, AppThemeModel, ConfigModel {
  MainStateModel() {
    // 初始化实例数据
  }
}
