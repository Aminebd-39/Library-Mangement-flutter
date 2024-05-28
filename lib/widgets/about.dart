import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: [
            // App name and version
            Text(
              'Library App',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

            Text(
              'Developed by:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Badri Mohammed Amine'),
            SizedBox(height: 16.0),

            Text(
              'This is a simple library app that allows you to manage a list of books.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

            Text(
              'Github @Aminebd-39',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
