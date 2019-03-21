import 'package:dio/dio.dart'
    show Dio, Options, LogInterceptor, DioError, BaseOptions;

Dio getDio([Options options]) {
  Dio dio = new Dio(BaseOptions(
    connectTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
  )); // with default Options
  // dio.interceptors.add(LogInterceptor(responseBody: true));
  return dio;
}

Future<dynamic> get(url, [data = const {}]) async {
  try {
    return await getDio().get(url).then((res) {
      return res.data;
    });
  } on DioError catch (e) {
    return e.response;
  }
}

Future post(url, [data = const {}, params = const {}]) async {
  return getDio().post(url, data: data, queryParameters: params);
}
