part of 'book_details_bloc.dart';

enum Status { initial, fetching, success, fetchFailure, deleted }

class BookDetailsState {
  final String id;

  Status status;
  UserBook? book;

  BookDetailsState({required this.id, this.book, Status? status})
      : status = status ?? ((book != null) ? Status.success : Status.initial);

  BookDetailsState.book({required Book book})
      : id = book.id,
        status = Status.success;

  BookDetailsState copyWith({
    String? id,
    UserBook? book,
    Status? status,
  }) {
    return BookDetailsState(
      id: id ?? this.id,
      book: book ?? this.book,
      status: status ?? this.status,
    );
  }
}
