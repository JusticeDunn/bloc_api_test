import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:better_reads/bloc/bloc.dart';
import 'package:better_reads/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(builder: (context, state) {
      if (state is BookEmpty) {
        return Center(
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
            onSubmitted: (String query) async {
              // Prepare multi word searches for url
              query = query.trim().replaceAll(' ', '_');
              BlocProvider.of<BookBloc>(context).add(FetchBook(query: query));
            },
          ),
        );
      }
      if (state is BookError) {
        return Center(
          child: Text('Failed to fetch book'),
        );
      }
      if (state is BookLoaded) {
        print(state.book.docs.length);
        if (state.book.docs.length <= 0) return Text('No books found!');
        return Center(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.book.docs.length
                  ? BottomLoader()
                  : BookListItem(book: state.book, index: index);
            },
            itemCount: state.book.docs.length,
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
