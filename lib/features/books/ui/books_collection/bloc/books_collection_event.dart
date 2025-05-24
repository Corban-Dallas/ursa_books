part of 'books_collection_bloc.dart';

sealed class BooksCollectionEvent {
  const BooksCollectionEvent();
}

final class BooksCollectionAddEvent extends BooksCollectionEvent {
  const BooksCollectionAddEvent();
}

/// Switch grid/list
final class BooksCollectionPresentationChangeEvent extends BooksCollectionEvent {
  final PresentationMode mode;
  const BooksCollectionPresentationChangeEvent(this.mode);
}

// Repository update event
final class RepositoryUserBookUpdate extends BooksCollectionEvent {
  final FlatEventUserBook event;
  RepositoryUserBookUpdate(this.event);
}
