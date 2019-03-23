import 'package:scoped_model/scoped_model.dart';
import 'user_model.dart' show UserModel;
import 'config_state_model.dart' show ConfigModel;

/**
 * get state: model.modelName.state.xxx
 * dispatch method: model.dispatch('modelName', 'methodsName', payload)
 *
 * import 'package:efox_flutter/store/index.dart' as Store
 * Store.model.config.state.isPro
 */

///主数据模型，需要全局使用的数据在这里添加模型
class MainStateModel extends Model with UserModel {
  Map<String, dynamic> state = {};
  ConfigModel config = ConfigModel();

  MainStateModel() {
    // 初始化实例数据
    // order for dispatch to get destination model's methods
    this.state = {
      'config': config,
    };
    //init model data
    config.getAppVersion();
    //
  }

  /**
   * dispatch method: model.dispatch('modelName', 'methodsName', payload)
   */
  Future dispatch(nameSpace, method, [payload]) async {
    await this.state[nameSpace].methods(method, payload);
    notifyListeners();
    return Future.value(this.state);
  }
}

//MainStateModel model = MainStateModel();
