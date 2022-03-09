import 'package:maven_digital_test/objects/model/book_model.dart';

abstract class IBookRepository {
  Future<BookResponse> getAll(
      {required String keywordsParameter, required int startIndex});
  Future<BookData> getOne(String volumeID);
}
