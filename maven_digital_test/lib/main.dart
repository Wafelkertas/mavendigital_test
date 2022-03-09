import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maven_digital_test/controller/home_controller.dart';
import 'package:maven_digital_test/repository/book_repository.dart';
import 'package:maven_digital_test/route.dart';

// Ini merupakan main function untuk menjalankan aplikasi
void main() {
  BookRepository bookRepository = Get.put(BookRepository());
  HomeController homeController = Get.put(HomeController());
  runApp(MyApp());
}

// Menginisiasikan aplikasi dengan route
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
