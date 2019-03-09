import 'package:scoped_model/scoped_model.dart' show ScopedModel, ScopedModelDescendant;
import './models/main_state_model.dart' show MainStateModel;
//export './models/main_state_model.dart';

/**
 * import 'package:efox_flutter/store/index.dart' as Store
 * Store.model.config.state.isPro
 */
class Store {
  static init({model, child}) {
    return ScopedModel<MainStateModel>(model: model, child: child);
  }

  static get(context) => ScopedModel.of<MainStateModel>(context);
  
  static connect({
    builder,
    child,
    rebuildOnChange = true,
  }) {
    print('builder=$builder');
    return ScopedModelDescendant<MainStateModel>(
        builder: builder, child: child, rebuildOnChange: rebuildOnChange);
  }
}

MainStateModel model = MainStateModel();

