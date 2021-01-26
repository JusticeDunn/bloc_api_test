import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:better_reads/repositories/repository.dart';
import 'package:better_reads/models/models.dart';
import 'package:better_reads/bloc/bloc.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository repository;

  BookBloc({@required this.repository})
      : assert(repository != null),
        super(BookEmpty());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is FetchBook) {
      yield BookLoading();
      try {
        final Book book = await repository.fetchBook(event.query);
        yield BookLoaded(book: book);
      } catch (_) {
        yield BookError();
      }
    } else {
      yield BookEmpty();
    }
  }
}
