import 'dart:async';

import 'package:meta/meta.dart';

import 'package:better_reads/repositories/book_api_client.dart';
import 'package:better_reads/models/models.dart';

class BookRepository {
  final BookApiClient bookApiClient;

  BookRepository({@required this.bookApiClient})
      : assert(bookApiClient != null);

  Future<Book> fetchBook(String query) async {
    return await bookApiClient.fetchBook(query);
  }
}
