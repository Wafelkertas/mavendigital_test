// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maven_digital_test/controller/home_controller.dart';
import 'package:maven_digital_test/objects/model/book_model.dart';
import 'package:maven_digital_test/route.dart';
import 'package:maven_digital_test/utils/constant.dart';
import 'package:maven_digital_test/views/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _textEditingController = TextEditingController();
  final HomeController _homeController = Get.find();
  late final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0);
  late Future<List<BookData>> _future;
  var offsetIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _future = _homeController.fetchAllBookInitialized();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _future = _homeController.fetchAllBooks(
              _textEditingController.text.isEmpty
                  ? DEFAULT_KEYWORDS
                  : _textEditingController.text,
              offsetIndex);
        });
      }
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
          centerTitle: true,
          title: Text(
            "Search Books",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, settingsScreen),
                icon: Icon(
                  Icons.settings,
                  color: Colors.black54,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextField(
                onSubmitted: ((value) {
                  offsetIndex = 0;
                  setState(() {
                    _future = _homeController.fetchAllBooks(
                        _textEditingController.text, 0);
                  });
                }),
                controller: _textEditingController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          offsetIndex = 0;
                          setState(() {
                            _future = _homeController.fetchAllBookInitialized();
                          });
                          _textEditingController.clear();
                        },
                        icon: Icon(Icons.highlight_off_rounded)),
                    label: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Expanded(
              child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: KeepAliveFutureBuilder(
                    future: _future,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 4,
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: CircularProgressIndicator()),
                          );
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            var listOfBook = snapshot.data as List<BookData>;

                            offsetIndex += listOfBook.length;
                            return _buildPage(listOfBook);
                          }
                        default:
                          return Container();
                      }
                    },
                  )),
            )
          ],
        ));
  }

  Widget _buildPage(List<BookData> listOfBook) {
    return ListView.builder(
        itemCount: listOfBook.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          // print(index);
          return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, detailBookRoute,
                      arguments: ToBookDetailArgument(listOfBook[index].id));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 250,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Image.network(listOfBook[index]
                                    .volumeInfo
                                    .imageLinks['thumbnail'] ??
                                ""),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text(
                                  listOfBook[index].volumeInfo.title,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 18),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      listOfBook[index]
                                          .volumeInfo
                                          .authors
                                          .join(", "),
                                      style: TextStyle(
                                          color: Color(0xFF000000)
                                              .withOpacity(0.5),
                                          fontSize: 18)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    listOfBook[index].volumeInfo.publisher,
                                    style: TextStyle(
                                        color:
                                            Color(0xFF000000).withOpacity(0.5),
                                        fontSize: 16),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(listOfBook[index]
                                      .volumeInfo
                                      .publishedDate),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ));
        });
  }
}

// Future builder dengan AutomaticKeepAliveClientMixin agar
// tidak terjadi rebuild saat data sudah ada di state
class KeepAliveFutureBuilder extends StatefulWidget {
  final Future future;
  final AsyncWidgetBuilder builder;

  KeepAliveFutureBuilder({required this.future, required this.builder});

  @override
  _KeepAliveFutureBuilderState createState() => _KeepAliveFutureBuilderState();
}

class _KeepAliveFutureBuilderState extends State<KeepAliveFutureBuilder>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: widget.builder,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
