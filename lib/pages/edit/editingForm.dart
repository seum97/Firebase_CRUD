import 'package:firestore_crud/pages/edit/edit.dart';
import 'package:firestore_crud/pages/service/databaseService.dart';
import 'package:flutter/material.dart';

import '../model/book.dart';

class EditForm extends StatefulWidget {
  // const EditForm({super.key});

  String? bookID = '';
  EditForm({this.bookID});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final formKey = GlobalKey<FormState>();
  String? newBookName;
  String? newAuthorName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Book>(
      stream: DatabaseService().getBookByBookID(widget.bookID!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Book? book = snapshot.data;
          return Form(
                    key: formKey,
                    child: Column(children: [
                      /// For Book Name ///
                      TextFormField(
                        initialValue: book?.bookName,
                        validator: (value) => value!.trim().isEmpty ? 'Please Enter Book Name !' : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          icon: Icon(Icons.book),
                          hintText: "Enter New Book Name",
                        ),
                        onChanged: (value) {
                          setState(() {
                            newBookName = value;
                          });
                        },
                      ),

                      ///For Author ///
                      TextFormField(
                        initialValue: book?.authorName,
                        validator: (value) => value!.trim().isEmpty ? 'Please Enter Author Name !' : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person_2),
                          hintText: "Enter New Author Name",
                        ),
                        onChanged: (value) {
                          setState(() {
                            newAuthorName = value;
                          });
                        },
                      ),

                      ElevatedButton(
                          onPressed: ()  {
                            if (formKey.currentState!.validate()) {
                              setState(() async {
                                Book newBook = Book.withoutPrice(
                                    id: book?.id,
                                    authorName: newAuthorName ?? book?.authorName,
                                    bookName: newBookName ?? book?.bookName
                                );
                               await DatabaseService().updateBook(newBook);
                                Navigator.pop(context);
                              });
                            }
                          },
                          child: Text("Keep Changes"))
                    ]),
                  );
        } else {
            return Text("Data Not Found");
        }
      }
    );
  }
}
