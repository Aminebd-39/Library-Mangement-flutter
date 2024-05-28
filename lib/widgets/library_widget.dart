import 'package:flutter/material.dart';
import 'book_details.dart';
import 'main.dart';
import '../models/Book.dart';

class LibraryWidget extends StatefulWidget {
  const LibraryWidget({super.key});

  @override
  State<LibraryWidget> createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {
  List<Book> books = [
    Book(
      title: "To Kill a Mockingbird",
      author: "Harper Lee",
      description: "A timeless story of racial prejudice in the Deep South, seen through the innocent eyes of a young girl.",
      imageUrl: "https://m.media-amazon.com/images/I/81aY1lxk+9L._AC_UF1000,1000_QL80_.jpg",
    ),
    Book(
      title: "Pride and Prejudice",
      author: "Jane Austen",
      description: "A witty social commentary about love and marriage in 19th-century England.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmGDdjB3BtBsNlojXlcS6p3wOF_tTLNBnlaqiM_WKzrw&s",
    ),
    Book(
      title: "The Lord of the Rings",
      author: "J. R. R. Tolkien",
      description: "An epic high fantasy that follows a hobbit on a quest to destroy the One Ring.",
      imageUrl: "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
    ),
    Book(
      title: "The Great Gatsby",
      author: "F. Scott Fitzgerald",
      description: "A tragic tale of love and loss set against the backdrop of the Roaring Twenties.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFq5nPmjMH_G6jqHq7Uz9CzFz6C54n31A8-EUX9jZ8PA&s",
    ),
    Book(
      title: "1984",
      author: "George Orwell",
      description: "A dystopian novel that explores themes of totalitarianism and surveillance.",
      imageUrl: "https://m.media-amazon.com/images/I/61NAx5pd6XL._AC_UF1000,1000_QL80_.jpg",
    ),
  ];

  // Add a function to update the book list (optional)
  void addBook(Book newBook) {
    setState(() {
      books.add(newBook);
    });
  }

  void _showAddBookDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController titleController = TextEditingController();
        final TextEditingController authorController = TextEditingController();
        final TextEditingController descriptionController = TextEditingController();
        final TextEditingController imageUrlController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Book'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Avoid potential overflow
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                TextField(
                  controller: authorController,
                  decoration: const InputDecoration(
                    labelText: 'Author',
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  maxLines: 3, // Allow for multi-line description
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                TextField(
                  controller: imageUrlController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Validate and add book
                final title = titleController.text;
                final author = authorController.text;
                final description = descriptionController.text;
                final imageUrl = imageUrlController.text;

                if (title.isEmpty || author.isEmpty || description.isEmpty || imageUrl.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill out all fields')),
                  );
                  return;
                }

                addBook(Book(
                  title: title,
                  author: author,
                  description: description,
                  imageUrl: imageUrl,
                ));
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Books library"),
      ),
      body: Center(
        child: Expanded(
          child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              Book book = books[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsScreen(book: book), // Pass the book
                      ),
                    );
                  },
                  leading: Image.network(book.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(book.title),
                  subtitle: Text('by ${book.author}\n${book.description}'),
                  isThreeLine: true,
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBookDialog();
        },
        tooltip: 'Add books',
        child: const Icon(Icons.add),
      ),
      drawer: const CustomDrawer(),
    );
  }
}