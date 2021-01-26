import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/book_bloc.dart';
import 'package:better_reads/repositories/book_api_client.dart';
import 'package:better_reads/repositories/book_repository.dart';
import 'package:better_reads/views/home_page.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();

  final BookRepository repository = BookRepository(
    bookApiClient: BookApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(
    repository: repository,
  ));
}

class App extends StatelessWidget {
  final BookRepository repository;

  App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BetterReads',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BetterReads'),
        ),
        body: BlocProvider(
          create: (context) => BookBloc(repository: repository),
          child: HomePage(),
        ),
      ),
    );
  }
}
