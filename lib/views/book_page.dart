import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  final book;

  BookPage({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${book['title']}'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Author(s): ${book['author_name']?.join(', ')}'),
            Text('Publisher(s): ${book['publisher']?.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
