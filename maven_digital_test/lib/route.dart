// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:maven_digital_test/views/book_detail/detail_book_view.dart';

import 'package:maven_digital_test/views/home/home_view.dart';
import 'package:maven_digital_test/views/settings/settings_view.dart';
import 'package:maven_digital_test/views/splash_screen/splash_screen_view.dart';

// Ini merupakan route navigation
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case detailBookRoute:
        var argumentData = settings.arguments as ToBookDetailArgument;
        return MaterialPageRoute(
            builder: (_) => DetailBookView(
                  volumeId: argumentData.volumeId,
                ));
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreenView());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

class ToBookDetailArgument {
  String volumeId;
  ToBookDetailArgument(this.volumeId);
}

const String homeRoute = '/';
const String detailBookRoute = 'detail_book';
const String splashScreen = 'splashScreen';
const String settingsScreen = 'settingsScreen';
