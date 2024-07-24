class Book {
  final int id;
  final String bookName;
  final String pdfUrl;

  Book({required this.id, required this.bookName, required this.pdfUrl});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'], bookName: json['bookName'], pdfUrl: json['pdfUrl']);
  }
}
