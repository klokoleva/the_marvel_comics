import 'dart:async';

import 'package:the_marvel_comics/model/charactermodel.dart';
import 'package:the_marvel_comics/services/characterservices.dart';

class CharactersBloc {
  final fetcher = StreamController<List<CharactersModel>?>();
  Stream get streamCharacters => fetcher.stream;

  Future fetch({String? nameStartsWith}) async {
    try {
      fetcher.sink.add(null);
      final data =
          await characterservices('20', '10', nameStartsWith: nameStartsWith);
      fetcher.sink.add(data);
    } catch (e) {
      fetcher.sink.addError(e.toString());
    }
  }

  flush() {
    fetcher.close();
  }
}
