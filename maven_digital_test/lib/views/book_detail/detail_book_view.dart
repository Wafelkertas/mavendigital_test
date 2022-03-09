// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maven_digital_test/controller/home_controller.dart';
import 'package:maven_digital_test/objects/model/single_book_model.dart';
import 'package:html/parser.dart';

class DetailBookView extends StatefulWidget {
  String volumeId;
  DetailBookView({Key? key, required this.volumeId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DetailBookViewState();
}

class DetailBookViewState extends State<DetailBookView> {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Detail",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black54),
        ),
        leadingWidth: 35,
        leading: IconButton(
            padding: EdgeInsets.only(left: 3, right: 0),
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.chevron_left,
              size: 35,
              color: Colors.black54,
            )),
        backgroundColor: Color.fromARGB(250, 250, 250, 255),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder(
          future: _homeController.fetchSingleBook(widget.volumeId),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 2,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator()),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return ListView(children: [
                    Container(
                      color: Color.fromARGB(250, 250, 250, 255),
                      height: 300,
                      width: 175,
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/basic.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text("Error Data, data not complete"),
                    )
                  ]);
                } else {
                  var data = snapshot.data as SingleBookResponse;
                  final document = parse(data.volumeInfo.description);
                  final String parsedString =
                      parse(document.body?.text).documentElement!.text;

                  return ListView(children: [
                    Container(
                      color: Color.fromARGB(250, 250, 250, 255),
                      height: 300,
                      width: 175,
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.center,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/basic.png',
                        image: data.volumeInfo.imageLinks.medium,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(250, 250, 250, 255),
                      padding: EdgeInsets.all(15),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Text(
                                  data.volumeInfo.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  data.volumeInfo.authors.join(),
                                ),
                              ),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Spacer(),
                                        Flexible(
                                          flex: 2,
                                          child: TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.teal),
                                            ),
                                            onPressed: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 80,
                                              height: 40,
                                              child: Text(
                                                "Preview",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Flexible(
                                          flex: 2,
                                          child: TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.deepOrange),
                                            ),
                                            onPressed: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 80,
                                              height: 40,
                                              child: Text(
                                                "Buy",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      height: 500,
                      color: Color.fromARGB(250, 250, 250, 255),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 1,
                        child: SingleChildScrollView(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 500,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1, child: Text("Book Description")),
                              Expanded(flex: 9, child: Text(parsedString)),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ]);
                }
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
