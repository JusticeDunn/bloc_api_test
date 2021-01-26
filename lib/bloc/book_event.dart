import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
}

class FetchBook extends BookEvent {
  final String query;

  const FetchBook({@required this.query});

  @override
  List<Object> get props => [query];
}
