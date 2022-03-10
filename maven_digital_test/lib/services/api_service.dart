import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: 'application/json;charset=UTF-8',
    responseType: ResponseType.plain,
  ));

  Dio setUpApi() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // print("Request! ${options.queryParameters}");
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // print("Response! ${response.data}");
      // print("Response! ${response.statusCode}");
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      return handler.next(e); //continue
    }));
    return dio;
  }

  getDio() {
    return setUpApi();
  }
}
