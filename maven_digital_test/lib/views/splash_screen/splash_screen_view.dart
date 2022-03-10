// View Splascreen
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maven_digital_test/views/home/home_view.dart';

class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeView())));
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
