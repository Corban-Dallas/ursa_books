part of 'books_collection_bloc.dart';

class BooksCollectionState {
  PresentationMode mode = PresentationMode.list;
  List<UserBook> items = List.empty();

  BooksCollectionState();

  BooksCollectionState copy() {
    var state = BooksCollectionState();
    state.mode = mode;
    state.items = List.of(items);
    return state;
  }
}

enum PresentationMode {
  list,
  grid;

  bool get isList => this == PresentationMode.list;
}
