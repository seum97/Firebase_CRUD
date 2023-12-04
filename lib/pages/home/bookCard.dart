import 'package:firestore_crud/pages/service/databaseService.dart';
import 'package:flutter/material.dart';
import '../model/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      color: Colors.grey[200],
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              book.bookName!,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              book.authorName!,
              style: TextStyle(fontSize: 15.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Edit Button
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/editBook',
                          arguments: {'bookObject': book});
                    },
                    child: Text("Edit")),

                // Delete Button
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            iconPadding: EdgeInsets.fromLTRB(250, 0, 0, 0),
                            icon: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            title: Text('Delete Book ?'),
                            content: Text(
                              'This Will permanently delete the book',
                              style: TextStyle(color: Colors.red[700]),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  DatabaseService().deleteBook(book.id!);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Detele'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Delete")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
