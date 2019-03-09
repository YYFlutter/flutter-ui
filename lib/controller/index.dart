import 'package:efox_flutter/store/index.dart' show model;

void initState() {
  model.dispatch('config', 'setVersion');
}