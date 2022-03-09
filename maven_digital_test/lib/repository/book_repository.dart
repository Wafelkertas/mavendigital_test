import 'package:dio/dio.dart';
import 'package:maven_digital_test/objects/model/single_book_model.dart';

import 'package:maven_digital_test/repository/abstract_book_repository.dart';
import 'package:http/http.dart' as http;

import '../objects/model/book_model.dart';

class BookRepository {
  ApiService apiService = ApiService();

  // Function to Get All the books
  @override
  Future<BookResponse> getAll(
      {required String keywordsParameter, required int startIndex}) async {
    try {
      Dio dio = apiService.getDio();
      var response = await dio
          .get('https://www.googleapis.com/books/v1/volumes', queryParameters: {
        "q": keywordsParameter,
        "startIndex": startIndex,
        "maxResults": 30
      });
      var data = BookResponse.fromJson(response.data);
      return data;
    } on DioError catch (e) {
      // print(e);
      throw Exception(e);
    }
  }

  @override
  Future<SingleBookResponse> getOne(String volumeID) async {
    try {
      var response = await apiService.dio
          .get('https://www.googleapis.com/books/v1/volumes/$volumeID');
      var data = SingleBookResponse.fromJson(response.data);
      return data;
    } on DioError catch (e) {
      // print(e);
      throw Exception(e);
    }
  }
}

class ApiService {
  Dio dio = Dio(BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: 'application/json;charset=UTF-8',
    responseType: ResponseType.plain,
  ));

  Dio setUpApi() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print("Request! ${options.queryParameters}");
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // print("Response! ${response.data}");
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
