import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maven_digital_test/objects/model/book_model.dart';

import 'package:maven_digital_test/repository/book_repository.dart';

class HomeController extends GetxController {
  final BookRepository _bookRepository = Get.find();
  var totalBooksDataInQuery = 0;
  final listOfBooks = <BookData>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _fetchAllBookInitialized();
  }

  // Fetch all data saat aplikasi dibuka
  void _fetchAllBookInitialized() async {
    isLoading.value = true;
    var booksResponse = await _bookRepository.getAll(
        keywordsParameter: 'keyword', startIndex: 0);

    print(booksResponse);

    isLoading.value = false;
    totalBooksDataInQuery = booksResponse.totalItems;
    listOfBooks.value = booksResponse.items;
  }

  // Fetch data setelah aplikasi dibuka
  void fetchAllBooks() async {
    try {
      var booksResponse = await _bookRepository.getAll(
          keywordsParameter: "keyword", startIndex: 0);
    } catch (e) {
      throw Exception(e);
    }
  }
}
