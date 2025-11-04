import 'package:bloc/bloc.dart';

import 'package:ursa_books/features/books/ui/books_collection/bloc/books_collection_bloc.dart';


part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  BookDetailsBloc({required ArkBooks ctr, required String id, UserBook? book})
      : _ctr = ctr,
        super(BookDetailsState(id: id, book: null)) {
    on<BookDetailsTapDelete>(_onTapDelete);
    on<BookDetailsCompletionStateToogled>(_onCompleteToogled);
    on<BookDetailsInitial>(_initialSetup);
    on<BookDetailsBindingEvent>(_bindingEvent);
    add(BookDetailsInitial());
  }

  final ArkBooks _ctr;
  RBookBinding? _binding;
  RBookSubscription? _subscription;

  Future<void> _onTapDelete(
    BookDetailsEvent event,
    Emitter<BookDetailsState> emit,
  ) async {
    await _binding?.delete();
  }

  Future<void> _onCompleteToogled(
    BookDetailsEvent event,
    Emitter<BookDetailsState> emit,
  ) async {
    var completed = state.book?.userData?.completed ?? false;
    completed = !completed;
    await _binding?.setCompleted(completed: completed);
  }

  Future<void> _initialSetup(
    BookDetailsEvent event,
    Emitter<BookDetailsState> emit,
  ) async {
    final binding = await _ctr.bookBinding(id: state.id);
    if (binding == null) {
      return;
    }
    final book = await binding.getModel();
    final newState = state.copyWith(book: book, status: Status.success);
    _binding = binding;
    emit(newState);

    final weakSelf = WeakReference(this);
    _subscription = await binding.subscribe(callback: (event) => weakSelf.target?.add(BookDetailsBindingEvent(event)));
  }

  Future<void> _bindingEvent(BookDetailsBindingEvent event, Emitter<BookDetailsState> emit) async {
    switch (event.event) {
      case RBookEntityEvent_Deleted():
        emit(state.copyWith(status: Status.deleted));
      // return;
      case RBookEntityEvent_Updated(field0: var book):
        final newState = state.copyWith(book: book, status: Status.success);
        emit(newState);
    }
  }
}
