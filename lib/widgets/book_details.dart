import 'package:flutter/material.dart';

import '../models/Book.dart';
import 'main.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: [
            // Large cover image
            Hero(
              tag: book.imageUrl, // Unique identifier for the image
              child: Image.network(
                book.imageUrl,
                height: 250.0, // Adjust image height as needed
              ),
            ),
            const SizedBox(height: 16.0), // Add some spacing
            Text(
              'Title:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(book.title),
            const SizedBox(height: 8.0),
            Text(
              'Author:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(book.author),
            const SizedBox(height: 8.0),
            Text(
              'Description:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(book.description),
          ],
        ),
      ),
    );
  }
}