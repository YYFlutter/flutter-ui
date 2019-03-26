import './provide_model/user_model.dart' show UserModel;
import './provide_model/config_model.dart' show ConfigModel;
import 'package:provide/provide.dart'
    show
        Provider,
        Provide,
        ProviderNode,
        Providers,
        ProvideMulti,
        ProviderScope;
import 'package:flutter/material.dart' show StreamBuilder;

//导出类型 以便全局调用
export './provide_model/user_model.dart';
export './provide_model/config_model.dart';

/**
 * import 'package:efox_flutter/store/provide.dart' as Store
 * Store.userModel
 * Store.configModel
 */
class Store {
  static init({model, child, dispose = true}) {
    Providers providers = Providers();
    UserModel userModel = UserModel();
    ConfigModel configModel = ConfigModel();
    providers
      ..provide(Provider<UserModel>.value(userModel))
      ..provide(Provider<ConfigModel>.value(configModel));
    return ProviderNode(
      child: child,
      providers: providers,
      dispose: dispose,
    );
  }

  /**
   * 获取
   */
  static get<T>(context, {scope}) => Provide.value<T>(context, scope: scope);
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
  static pm(
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
}
