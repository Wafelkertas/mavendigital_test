// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:maven_digital_test/controller/home_controller.dart';
import 'package:maven_digital_test/objects/model/book_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _textEditingController;
  final HomeController _homeController = Get.find();
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      print(_textEditingController.value.text);
    });
    _scrollController.addListener(() {
      print(_scrollController.position);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Search Books",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextField(
                controller: _textEditingController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    label: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Obx(() => AnimationLimiter(
                      child: _homeController.listOfBooks.isNotEmpty
                          ? ListView.builder(
                              controller: _scrollController,
                              itemCount: _homeController.listOfBooks.length,
                              itemBuilder: (context, index) {
                                BookData data =
                                    _homeController.listOfBooks[index];
                                String image = data.volumeInfo
                                            .imageLinks["thumbnail"] !=
                                        null
                                    ? data.volumeInfo.imageLinks["thumbnail"]!
                                    : "";
                                return AnimationConfiguration.staggeredList(
                                    duration: Duration(milliseconds: 500),
                                    position: index,
                                    child: SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                          child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Material(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                height: 250,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Image.network(
                                                              image),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                data.volumeInfo
                                                                    .title,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                    data.volumeInfo
                                                                        .authors
                                                                        .join(
                                                                            ", "),
                                                                    style: TextStyle(
                                                                        color: Color(0xFF000000).withOpacity(
                                                                            0.5),
                                                                        fontSize:
                                                                            18)),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  data.volumeInfo
                                                                      .publisher,
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                              0xFF000000)
                                                                          .withOpacity(
                                                                              0.5),
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(data
                                                                    .volumeInfo
                                                                    .publishedDate),
                                                              ),
                                                            ],
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            )),
                                      )),
                                    ));
                              },
                            )
                          : ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 250,
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              }))),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: GestureDetector(onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _textEditingController.clear();
                  }),
                )
              ],
            ))
          ],
        ));
  }
}
