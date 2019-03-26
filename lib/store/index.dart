import 'package:flutter/material.dart' show StreamBuilder;
import 'package:provide/provide.dart'
    show
        Provider,
        Provide,
        ProviderNode,
        Providers,
        ProvideMulti,
        ProviderScope;
export 'package:provide/provide.dart';
import './models/config_state_model.dart' show ConfigModel;
import './models/user_model.dart' show UserModel;
import './models/author_state_model.dart' show AuthorModel;
export './models/config_state_model.dart' show ConfigModel;
export './models/user_model.dart' show UserModel;
export './models/author_state_model.dart' show AuthorModel;

class Store {
  static init({model, child, dispose = true}) {
    final providers = Providers()
      ..provide(Provider.value(ConfigModel()))
      ..provide(Provider.value(UserModel()))
      ..provide(Provider.value(AuthorModel()));

    return ProviderNode(
      child: child,
      providers: providers,
      dispose: dispose,
    );
  }

  /**
   * 获取
   */
  static valueNotContext<T>(value) {
    return Providers().provideValue<T>(value);
  }

  /**
   * 根据 Context 获取
   */
  static value<T>(context, {scope}) {
    return Provide.value<T>(context, scope: scope);
  }

  /**
   * 监听
   */
  static connect<T>({builder, child, scope}) {
    return Provide<T>(
      builder: builder,
      child: child,
      scope: scope,
    );
  }

  /**
   * 通过流的方式 监听
   */
  static stream<T>({builder, model, context}) {
    return StreamBuilder<T>(
        initialData: model,
        stream: Provide.stream<T>(context),
        builder: builder);
  }

  /**
   * 链接多个类型
   */
  static multi(
      {builder,
      child,
      List<Type> requestedValues,
      Map<ProviderScope, List<Type>> requestedScopedValues}) {
    return ProvideMulti(
        builder: builder,
        child: child,
        requestedValues: requestedValues,
        requestedScopedValues: requestedScopedValues);
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
