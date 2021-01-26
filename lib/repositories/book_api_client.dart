import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:better_reads/models/models.dart';

class BookApiClient {
  final _baseUrl = 'https://openlibrary.org/search.json?q=';
  final http.Client httpClient;
  BookApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Book> fetchBook(String query) async {
    final url = '${_baseUrl}$query'; // TODO get search results
    print(url);
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return Book.fromJson(json);
  }
}
