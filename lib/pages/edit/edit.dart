import 'package:firestore_crud/pages/edit/editingForm.dart';
import 'package:firestore_crud/pages/model/book.dart';
import 'package:flutter/material.dart';

import '../service/databaseService.dart';

class EditBook extends StatefulWidget {
  const EditBook({super.key});

  @override
  State<EditBook> createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  Map<String, Book> bookDetails = {};
  static String? bookID = '';

  // Modal Bottom Sheet
  void _showEditPanel(String bookID) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(30),
            child:
                EditForm(bookID: bookID),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    bookDetails =
        ModalRoute.of(context)?.settings.arguments as Map<String, Book>;
    bookID = bookDetails['bookObject']?.id;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details - Second Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: StreamBuilder<Book>(
            stream: DatabaseService().getBookByBookID(bookID!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Book? currentBook = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book Name:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      '${currentBook!.bookName}',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(height: 40,),
                    Text(
                      'Book Author:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      '${currentBook.authorName}',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(height: 40,),
                    Text(
                      'Book Price:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      '${currentBook.price}',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showEditPanel(bookID!);
                          },
                          label: const Text('Edit'),
                        ),
                        SizedBox(width: 40,),
                        ElevatedButton.icon(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          label: const Text('Go back!'),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Text("Data Not Found");
              }
            }),
      ),
    );
  }
}
