import 'package:bloc/bloc.dart';

import 'package:ursa_books/data/rust/third_party/ark_backend_api/creative_work/book.dart';
import '../../../domain/user_books_repository.dart';

part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  BookDetailsBloc({required UserBooksRepository booksRepository, required String id, Book? book})
      : _booksRepository = booksRepository,
        super(BookDetailsState(id: id, book: book)) {
    on<BookDetailsTapDelete>(_onTapDelete);
  }

  final UserBooksRepository _booksRepository;

  Future<void> _onTapDelete(
    BookDetailsEvent event,
    Emitter<BookDetailsState> emit,
  ) async {
    await _booksRepository.delete(state.id);
    emit(state.copyWith(status: Status.deleted));
  }

  _initialFetch() {}
}
