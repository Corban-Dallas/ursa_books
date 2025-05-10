part of 'books_collection_bloc.dart';

class BooksCollectionState {
  bool isList = true;
  List<UserBook> items = List.empty();

  BooksCollectionState();

  BooksCollectionState copy() {
    var state = BooksCollectionState();
    state.isList = isList;
    state.items = List.of(items);
    return state;
  }
}
