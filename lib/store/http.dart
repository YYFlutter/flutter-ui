import 'package:dio/dio.dart';

Future<dynamic> get(url, [data = const {}]) async {
  Dio dio = new Dio(); // with default Options
  // dio.interceptors
  //     .add(InterceptorsWrapper(onRequest: (RequestOptions requestOptions) {
  //   return dio.resolve('sfs');
  // }));
  dio.interceptors.add(LogInterceptor(responseBody: true));
  try {
    return await dio.get(url).then((res) => res.data);
  } on DioError catch(e) {
    return e.response;
  }
}

Future post(url, [data = const {}, params = const {}]) async {
  Dio dio = new Dio(); // with default Options
  // dio.interceptors
  //     .add(InterceptorsWrapper(onRequest: (RequestOptions requestOptions) {
  //   return dio.resolve('sfs');
  // }));
  return dio.post(url, data: data, queryParameters: params);
}
