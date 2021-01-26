import 'package:flutter/material.dart';
import 'package:better_reads/models/book.dart';
import 'package:better_reads/views/book_page.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({Key key, @required this.book, @required this.index})
      : super(key: key);

  final Book book;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${index + 1}',
      ),
      title: Text(
        '${book.docs[index]['title']}',
        style: TextStyle(fontSize: 10.0),
      ),
      subtitle: Text(
        // Make sure author name exists
        'Written by: ${book.docs[index]['author_name']?.join(', ')}',
        style: TextStyle(fontSize: 10.0),
      ),
      dense: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookPage(book: book.docs[index])),
        );
      },
    );
  }
}
