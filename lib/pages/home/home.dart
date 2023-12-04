import 'package:firestore_crud/pages/service/databaseService.dart';
import 'package:flutter/material.dart';

import '../model/book.dart';
import 'bookCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var bookController = TextEditingController();
  var authorController = TextEditingController();
  var priceController = TextEditingController();
  bool crossVisible = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List App - First Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: StreamBuilder<List<Book>>(
                      stream: DatabaseService().readBooks(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final bookList = snapshot.data;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: bookList!
                                .map((book) => BookCard(book: book))
                                .toList(),
                          );
                        } else {
                          return Text("Data Not found");
                        }
                      }),
                ),
              ),
            ),
            Container(
              height: 300,
              child: Form(
                key: formKey,
                child: Column(children: [
                  Divider(
                    height: 30,
                    color: Colors.black,
                    indent: 5,
                    endIndent: 5,
                    thickness: 0.7,
                  ),

                  /// For Book Name ///
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: bookController,
                      onTap: () {
                        setState(() {
                          crossVisible = true;
                        });
                      },
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          crossVisible = false;
                        });
                      },
                      onFieldSubmitted: (text) {
                        setState(() {
                          crossVisible = false;
                        });
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please Enter Book Name !';
                        } else
                          return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        icon: Icon(Icons.book),
                        border: OutlineInputBorder(),
                        label: Text(
                          'Enter Book Name',
                          style: TextStyle(fontSize: 20),
                        ),
                        suffixIcon: Visibility(
                          visible: crossVisible,
                          child: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              bookController.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///For Author ///
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: authorController,
                      onTap: () {
                        setState(() {
                          crossVisible = true;
                        });
                      },
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          crossVisible = false;
                        });
                      },
                      onFieldSubmitted: (text) {
                        setState(() {
                          crossVisible = false;
                        });
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter Author Name !';
                        } else
                          return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person_2),
                        border: OutlineInputBorder(),
                        label: Text(
                          'Enter Author',
                          style: TextStyle(fontSize: 20),
                        ),
                        suffixIcon: Visibility(
                          visible: crossVisible,
                          child: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              authorController.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// For Price ///
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: priceController,
                      onTap: () {
                        setState(() {
                          crossVisible = true;
                        });
                      },
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          crossVisible = false;
                        });
                      },
                      onFieldSubmitted: (text) {
                        setState(() {
                          crossVisible = false;
                        });
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter Price !';
                        } else
                          return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        icon: Icon(Icons.price_change_sharp),
                        border: OutlineInputBorder(),
                        label: Text(
                          'Enter Price',
                          style: TextStyle(fontSize: 20),
                        ),
                        suffixIcon: Visibility(
                          visible: crossVisible,
                          child: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              priceController.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setState(() async {
                              await DatabaseService().createBook(
                                  bookName: bookController.text,
                                  authorName: authorController.text,
                                  price: priceController.text);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 3),
                                content: Column(
                                  children: [
                                    Text('Hello User!!'),
                                    Text('Book Created Successfully !'),
                                  ],
                                ),
                              ));
                            });
                          }
                        },
                        child: Text("Submit")),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
