import 'package:flutter/material.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Consumer, Provider;
export 'package:provider/provider.dart';
//
import './models/config_state_model.dart' show ConfigModel;
import './models/user_model.dart' show UserModel;
import './models/author_state_model.dart' show AuthorModel;
export './models/config_state_model.dart' show ConfigModel;
export './models/user_model.dart' show UserModel;
export './models/author_state_model.dart' show AuthorModel;

class Store {
  static BuildContext context;
  static of(BuildContext context) {
    Store.context ??= context;
    return context;
  }

  static init({child}) {
    return MultiProvider(
      child: child,
      providers: [
        ChangeNotifierProvider(builder: (_) => ConfigModel()),
        ChangeNotifierProvider(builder: (_) => UserModel()),
        ChangeNotifierProvider(builder: (_) => AuthorModel()),
      ],
    );
  }

  static T value<T>([BuildContext context]) {
    context ??= Store.context;
    return Provider.of<T>(context);
  }


}

