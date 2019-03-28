import 'package:dio/dio.dart'
    show
        Dio,
        DioError,
        Options,
        InterceptorsWrapper,
        RequestOptions,
        LogInterceptor,
        Response;
import 'package:efox_flutter/utils/localStorage.dart' show LocalStorage;
import 'log.dart' show log;
import 'package:efox_flutter/store/index.dart' show Store;
import 'package:flutter/material.dart';
import 'loadingDialog.dart' show showAppLoading;

Dio getDio([Options options]) {
  if (options == null) {
    options = Options(
      headers: {
        'context-type': 'application/json',
      },
    );
  }
  Dio dio = new Dio(); // with default Options

  // dio.options.baseUrl = "http://www.dtworkroom.com/doris/1/2.0.0/";
  dio.options.connectTimeout = 30 * 1000; //5s
  dio.options.receiveTimeout = 30 * 1000;
  dio.options.headers = options.headers;

  // Add request interceptor
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options) async {
      String token = await LocalStorage.get('githubRespLoginToken');
      if (options.headers['Authorization'] == null && token != null) {
        options.headers['Authorization'] = 'token $token';
      }
      print(
          ' Store.widgetCtx -------------------------------- ${Store.widgetCtx}');
      showAppLoading();
      log('【发送请求】 ${options.uri} ', '${options.headers}  ${options.data}');
      // Do something before request is sent
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    },
    onResponse: (Response response) async {
      log('【请求成功】 ${response.request.uri}，【状态码 ${response.statusCode}】',
          response);
      showAppLoading();
      return {'data': response.data}; // continue
    },
    onError: (DioError e) async {
      // showAppLoading();
      dynamic msg = e.message;
      dynamic code = 0; // 错误码
      dynamic status = e.type; // http请求状态
      if (e.response != null && e.response.data != null) {
        code = 1;
        msg = e.response.data;
        status = e.response.statusCode;
      }
      log('【请求失败】 ${e.request.uri}，【状态码 ${status}】【code】: ${code}', msg);
      return {'msg': msg, 'code': code, 'status': status};
    },
  ));
  dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志

  return dio;
}

Future<dynamic> get({url, data = const {}}) async {
  return getDio().get(url).then((resp) => resp.data);
}

Future post({url, data = const {}, options}) async {
  return getDio(options).post(url, data: data).then((resp) {
    return resp.data;
  });
}
