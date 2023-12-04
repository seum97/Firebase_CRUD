import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../model/book.dart';

class DatabaseService {
  // creating an instance of firebase auth to allow us to communicate with firebase auth class
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // firestore collection reference (collection will be created automatically if not found in firestore DB)
  final CollectionReference bookCollection = FirebaseFirestore.instance.collection('books');


  // Create new documents in 'books' collection
  Future createBook({required String bookName, required String authorName, required String price}) async{

    final docBook = bookCollection.doc();
    final Book book = Book(
      id: docBook.id,
      bookName: bookName,
      authorName: authorName,
      price: price
    );
    final jsonBook = book.toJson();

    return await docBook.set(jsonBook);

    // return await bookCollection.doc().set({
    //   'id': bookCollection.id,
    //   'bookName': bookName,
    //   'authorName': authorName,
    //   'price': price
    // });
  }

  // Used to map snapshot into a list of Book Object
  List<Book> bookListFromSnapshot(QuerySnapshot snapshot){
    final bookList = snapshot.docs.map(
            (doc) => Book(
            id: doc.id,
            bookName: doc.get('bookName'),
            authorName: doc.get('authorName'),
            price: doc.get('price')
        )
    ).toList();
    return bookList;

  }

  // Read documents from book Collection
  Stream<List<Book>> readBooks(){
    return bookCollection.snapshots().map(bookListFromSnapshot);
  }


  //  Map snapshot into one Book Object
  Book bookObjectFromSnapshot(DocumentSnapshot snapshot){
    return Book(
      id: snapshot.id,
      authorName: snapshot.get('authorName'),
      bookName: snapshot.get('bookName'),
      price: snapshot.get('price')
    );
  }

  // Get book by book id
  Stream<Book> getBookByBookID(String bookID){
    return bookCollection.doc(bookID).snapshots().map(bookObjectFromSnapshot);
  }

  // Update documents from book Collection
  Future updateBook(Book book) async{
    final docBook = bookCollection.doc(book.id);
    return await docBook.update({
      'bookName': book.bookName,
      'authorName': book.authorName
    });
  }

  // Delete Book
  Future deleteBook(String bookID) async{
    final docBook = bookCollection.doc(bookID);
    return await docBook.delete();
  }
}