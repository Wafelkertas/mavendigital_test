import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maven_digital_test/objects/model/book_model.dart';
import 'package:maven_digital_test/objects/model/single_book_model.dart';

import 'package:maven_digital_test/repository/book_repository.dart';

class HomeController extends GetxController {
  final BookRepository _bookRepository = Get.find();
  var totalBooksDataInQuery = 0;
  final listOfBooks = <BookData>[].obs;
  final isLoading = false.obs;
  int offsetPage = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchAllBookInitialized();
  }

  // Fetch all data saat aplikasi dibuka
  Future<List<BookData>> fetchAllBookInitialized() async {
    // isLoading.value = true;
    var booksResponse = await _bookRepository.getAll(
        keywordsParameter: 'keyword', startIndex: 0);

    print(booksResponse);

    // isLoading.value = false;
    totalBooksDataInQuery = booksResponse.totalItems;
    offsetPage += 5;

    return booksResponse.items;
  }

  // Fetch data setelah aplikasi dibuka
  Future<List<BookData>> fetchAllBooks(String keyword, int startIndex) async {
    print("startIndex $startIndex");
    try {
      var booksResponse = await _bookRepository.getAll(
          keywordsParameter: keyword, startIndex: startIndex);

      return booksResponse.items;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Fetch data saat di detail buku
  Future<SingleBookResponse> fetchSingleBook(String volumeId) async {
    try {
      var singleBookResponse = await _bookRepository.getOne(volumeId);
      return singleBookResponse;
    } catch (e) {
      throw Exception(e);
    }
  }
}
