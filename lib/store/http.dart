import 'package:dio/dio.dart' show Dio, DioError, Options, InterceptorsWrapper, RequestOptions, Response;

Dio getDio([Options options]) {
  if (options == null) {
    options = Options(
      headers: {
        'context-type': 'application/json',
        'user-agent': 'dio',
        'common-header': 'xx'
      },
    );
  }
  Dio dio = new Dio(); // with default Options

  // dio.options.baseUrl = "http://www.dtworkroom.com/doris/1/2.0.0/";
  dio.options.connectTimeout = 30 * 1000; //5s
  dio.options.receiveTimeout = 30 * 1000;
  dio.options.headers = options.headers;
  
  dio.interceptors.add(InterceptorsWrapper(
    onRequest:(RequestOptions options){
     // Do something before request is sent
     return options; //continue
     // If you want to resolve the request with some custom data，
     // you can return a `Response` object or return `dio.resolve(data)`.
     // If you want to reject the request with a error message, 
     // you can return a `DioError` object or return `dio.reject(errMsg)`    
    },
    onResponse:(Response response) {
     // Do something with response data
     print('onResponse --- $response');
     return response; // continue
    },
    onError: (DioError e) {
     // Do something with response error
     print('onError --- $e');
     return  e;//continue
    }
));

  // Add request interceptor
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

Future post(url, [data = const {}, params = const {}, options]) async {
  return getDio(options).post(url, data: data);
}
