import 'package:provide/provide.dart'
    show Provider, Providers, ProviderNode, Provide;
// import 'package:flutter/material.dart' show StreamBuilder;
import './models/config_state_model.dart' show ConfigModel;
import './models/user_model.dart' show UserModel;
import './models/author_state_model.dart' show AuthorModel;
export './models/config_state_model.dart' show ConfigModel;
export './models/user_model.dart' show UserModel;
export './models/author_state_model.dart' show AuthorModel;
export 'package:provide/provide.dart'
    show Provider, Providers, ProviderNode, Provide;

class Store {
  static init({child}) {
    final providers = Providers()
      ..provide(Provider.value(ConfigModel()))
      ..provide(Provider.value(UserModel()))
      ..provide(Provider.value(AuthorModel()));
    print('store init');
    return ProviderNode(providers: providers, child: child);
  }
  static valueNotContext<T>(value) {
    return Providers().provideValue<T>(value);
  }
  static value<T>(context) {
    return Provide.value<T>(context);
  }

  static connect<T>({builder}) {
    return Provide<T>(builder: builder);
  }

  // static connect({context, builder, child}) {
  // final currentCounter = Provide.value<Counter>(context);
  // print('currentCounter ${currentCounter} ');
  // return StreamBuilder<Counter>(
  //   initialData: currentCounter,
  //   stream: Provide.stream<Counter>(context).where((count) {
  //     return true;
  //   }),
  //   // .where((counter){
  //   // 当返回true时，刷新页面
  //   //   return counter.value % 2 == 0;
  //   // }),
  //   builder: builder,
  // );
  // }
}
