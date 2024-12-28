part of 'book_details_bloc.dart';

sealed class BookDetailsEvent {
  const BookDetailsEvent();
}

final class BookDetailsTapDelete extends BookDetailsEvent {
  const BookDetailsTapDelete();
}
