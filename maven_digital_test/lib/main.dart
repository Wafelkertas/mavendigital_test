// ignore_for_file: unnecessary_new

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maven_digital_test/controller/home_controller.dart';
import 'package:maven_digital_test/repository/book_repository.dart';
import 'package:maven_digital_test/route.dart';
import 'package:maven_digital_test/views/home/home_view.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 300,
        color: Colors.white,
        child: Image.asset('assets/images/maven.jpeg'));
  }
}
