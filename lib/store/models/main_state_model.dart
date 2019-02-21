import 'package:scoped_model/scoped_model.dart';
import 'user_model.dart';
import 'theme_model.dart';

///主数据模型，需要全局使用的数据在这里添加模型
class MainStateModel extends Model with UserModel, AppThemeModel {
  MainStateModel() {
    // 初始化实例数据
  }
}
