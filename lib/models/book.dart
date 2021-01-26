import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final List docs;

  const Book({
    this.docs,
  });

  @override
  List<Object> get props => [docs];

  static Book fromJson(dynamic json) {
    return Book(
      docs: json['docs'],
    );
  }

  @override
  String toString() => 'Quote { id: $docs }';
}
