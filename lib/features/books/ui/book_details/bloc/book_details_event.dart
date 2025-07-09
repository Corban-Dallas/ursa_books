part of 'book_details_bloc.dart';

sealed class BookDetailsEvent {
  const BookDetailsEvent();
}

final class BookDetailsTapDelete extends BookDetailsEvent {
  const BookDetailsTapDelete();
}

final class BookDetailsCompletionStateToogled extends BookDetailsEvent {
  const BookDetailsCompletionStateToogled();
}

final class BookDetailsInitial extends BookDetailsEvent {
  const BookDetailsInitial();
}

final class BookDetailsBindingEvent extends BookDetailsEvent {
  final RBookEntityEvent event;
  BookDetailsBindingEvent(this.event);
}