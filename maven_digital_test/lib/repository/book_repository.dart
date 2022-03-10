import 'package:dio/dio.dart';
import 'package:maven_digital_test/objects/model/single_book_model.dart';

import 'package:maven_digital_test/repository/abstract_book_repository.dart';
import 'package:maven_digital_test/utils/constant.dart';

import '../objects/model/book_model.dart';
import '../services/api_service.dart';

class BookRepository extends IBookRepository {
  ApiService apiService = ApiService();

  // Function to Get All the books
  // Get All
  @override
  Future<BookResponse> getAll(
      {required String keywordsParameter, required int startIndex}) async {
    try {
      Dio dio = apiService.getDio();
      var response = await dio
          .get('https://www.googleapis.com/books/v1/volumes', queryParameters: {
        "q": keywordsParameter,
        "startIndex": startIndex,
        "maxResults": MAX_RESULT
      });
      var data = BookResponse.fromJson(response.data);

      return data;
    } on DioError catch (e) {
      // print(e);
      throw Exception(e);
    }
  }

  // Fungsi untuk get json single book
  // GET single
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
