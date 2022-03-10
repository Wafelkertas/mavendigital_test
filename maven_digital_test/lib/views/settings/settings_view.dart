// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = 30.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color.fromARGB(250, 250, 250, 255),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color.fromARGB(250, 250, 250, 255),
        child: Column(
          children: [
            Expanded(child: Container()),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Copyright WafelKertas",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
            ))
          ],
        ),
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
