import 'package:dio/dio.dart'
    show
        Dio,
        DioError,
        Options,
        InterceptorsWrapper,
        RequestOptions,
        // LogInterceptor,
        Response;
import 'package:efox_flutter/utils/localStorage.dart' show LocalStorage;

void _print(title, message) {
  if (message == null) {
    print('$title');
  } else {
    print('=================$title=============');
    print('$message');
    print('=================response end=============');
  }
  ;
}

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
  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    String token = await LocalStorage.get('githubRespLoginToken') ?? '';
    if (options.headers['Authorization'] == null) {
      options.headers['Authorization'] = 'token $token';
    }
    // Do something before request is sent
    return options; //continue
    // If you want to resolve the request with some custom data，
    // you can return a `Response` object or return `dio.resolve(data)`.
    // If you want to reject the request with a error message,
    // you can return a `DioError` object or return `dio.reject(errMsg)`
  }, onResponse: (Response response) {
    // Do something with response data
    _print('http.dart response success', response);
    return response; // continue
  }, onError: (DioError e) {
    // Do something with response error
    _print('http.dart response fail',
        '${e.response.data}   status: ${e.response.statusCode}');
    // return e; //continue
  }));
  // dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志

  return dio;
}

Future<dynamic> get({url, data = const {}}) async {
  try {
    return getDio().get(url).then((resp) => resp.data);
  } on DioError catch (e) {
    return {'code': e.response.statusCode, 'msg': e.response.data};
  }
}

Future post({url, data = const {}, options}) async {
  try {
    return getDio(options).post(url, data: data).then((resp) => resp.data);
  } on DioError catch (e) {
    return {'code': e.response.statusCode, 'msg': e.response.data};
  }
}
