class Book {
  String title;
  String author;
  String description;
  String imageUrl;

  Book(
      {required this.title, required this.author, required this.description, required this.imageUrl});

  factory Book._fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'],
        author: 'Amine Badri',
        description: json['description'],
        imageUrl: json['imageUrl']
    );
  }

  Map<String, dynamic> _toJson() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  static List<Map<String, dynamic>> booksToJson(List<Book> books) {
    return books.map((book) => book._toJson()).toList();
  }

  static List<Book> booksFromJson(List<dynamic> json) {
    return json.map((item) => Book._fromJson(item as Map<String, dynamic>)).toList();
  }

}