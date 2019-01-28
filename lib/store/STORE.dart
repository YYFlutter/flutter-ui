import 'package:scoped_model/scoped_model.dart';
import './models/MainStateModel.dart';
export './models/MainStateModel.dart';

class STORE {
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
