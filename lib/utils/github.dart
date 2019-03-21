/* import 'dart:io';
import 'package:dio/dio.dart';


Dio _dio([Options options]) {
  Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://api.github.com/graphql',
    contentType: ContentType.parse('application/json;charset=UTF-8'),
    connectTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
  )); // with default Options
  dio.interceptors.add(LogInterceptor(responseBody: true)); // debug
  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    options.headers["Authorization"] = 'Bearer $token';
    return options;
  }, onResponse: (Response response) {
    return response;
  }, onError: (DioError e) {
    return e;
  })); //debug
  return dio;
}

Future fetch(String query) async {
  Map map = {'query': query};
  return _dio().post('', data: map);
}


github.fetch('''
query { 
  viewer{
    login
  }
}
  ''');
 */
