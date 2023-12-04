class Book {
  String? id;
  String? bookName;
  String? authorName;
  String? price;

  Book({this.id = '', this.bookName, this.authorName, this.price});
  Book.withoutPrice({this.id, this.authorName, this.bookName});

  // Used to convert a book object into a map / json
  Map<String, dynamic> toJson() => {
    'id': id,
    'bookName': bookName,
    'authorName': authorName,
    'price': price
  };

// Used to convert a map / json into a book object
//   Book fromJson(Map<String, dynamic> json) => Book(
//       id: json['id'],
//       bookName: json['bookName'],
//       authorName: json['authorName'],
//       price: json['price']
//     );
}
