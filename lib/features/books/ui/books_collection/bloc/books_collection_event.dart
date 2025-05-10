part of 'books_collection_bloc.dart';

sealed class BooksListEvent {
  const BooksListEvent();
}

final class BooksCollectionAddEvent extends BooksListEvent {
  const BooksCollectionAddEvent();
}

/// Switch grid/list
final class BooksCollectionPresentationToogleEvent extends BooksListEvent {
  const BooksCollectionPresentationToogleEvent();
}

// Repository update event
final class RepositoryUserBookUpdate extends BooksListEvent {
  final FlatEventUserBook event;
  RepositoryUserBookUpdate(this.event);
}
