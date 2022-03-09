import 'package:dio/dio.dart';

import 'package:maven_digital_test/repository/abstract_book_repository.dart';
import 'package:http/http.dart' as http;

import '../objects/model/book_model.dart';

class BookRepository {
  var dio = Dio(BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: 'application/json;charset=UTF-8',
    responseType: ResponseType.plain,
  ));

  // Function to Get All the books
  @override
  Future<BookResponse> getAll(
      {required String keywordsParameter, required int startIndex}) async {
    // final queryParameters = {"q": "keyword"};
    // final uri =
    //     Uri.https("www.googleapis.com", "/books/v1/volumes", queryParameters);
    try {
      var response = await dio.get(
          'https://www.googleapis.com/books/v1/volumes',
          queryParameters: {"q": keywordsParameter, "startIndex": startIndex});
      var data = BookResponse.fromJson(response.data);
      return data;
      // var response = await http.get(uri);
      // print(response);

      // var data = BookResponse.fromJson(response.body);
      // if (response.statusCode == 200) {
      //   var data = BookResponse.fromJson(response.body);
      //   print(data.items.toString());

      //   return data;

      // }
      // throw Exception("error");
    } on DioError catch (e) {
      // print(e);
      throw Exception(e);
    }
  }

  @override
  Future<BookData> getOne(String volumeID) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  // dio interceptor
  void dioInterceptor(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // print("Request! ${options.data}");
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // print("Response! ${response.data}");
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      return handler.next(e); //continue
    }));
  }
}
