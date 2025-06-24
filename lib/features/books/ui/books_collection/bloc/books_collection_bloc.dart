import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import '../../../domain/user_books_repository.dart';

export 'package:ursa_books/data/rust/third_party/ark_backend_api/creative_work/book.dart';
export 'package:ursa_books/data/rust/api/books.dart';
export 'package:ursa_books/data/rust/api/user_books.dart';

part 'books_collection_event.dart';
part 'books_collection_state.dart';

class BooksCollectionBloc extends Bloc<BooksCollectionEvent, BooksCollectionState> {
  final UserBooksRepository repository;
  OCTransaction<UserBook>? transaction;

  BooksCollectionBloc(this.repository) : super(BooksCollectionState()) {
    on<BooksCollectionAddEvent>(_onAddBookTap);
    on<BooksCollectionPresentationChangeEvent>(_onChangePresentationMode);
    on<RepositoryUserBookUpdate>(_handleOcEvent);
    repository.subscribe(_collectionEvent);
  }

  @override
  Future<void> close() async {
    await super.close();
    repository.unsubscribe();
  }

  void dispose() {
    repository.unsubscribe();
  }

  void _collectionEvent(FlatEventUserBook event) {
    final e = RepositoryUserBookUpdate(event);
    add(e);
  }

  Future<void> _onAddBookTap(BooksCollectionAddEvent event, Emitter<BooksCollectionState> emit) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ["epub"]);
    if (result == null) return;
    final path = result.files.first.path;
    if (path == null) return;
    await repository.importBook(path);
  }

  void _onChangePresentationMode(BooksCollectionPresentationChangeEvent event, Emitter<BooksCollectionState> emit) {
    var newState = state.copy();
    newState.mode = event.mode;
    emit(newState);
  }

  void _handleOcEvent(RepositoryUserBookUpdate event, Emitter<BooksCollectionState> emit) {
    switch (event.event) {
      case FlatEventUserBook_BeginTasnsaction():
        if (transaction != null) {
          throw AssertionError("Transaction already exist");
        }
        transaction = OCTransaction(state.items);

      case FlatEventUserBook_FinishTransaction():
        var newState = state;
        newState.items = transaction!.result();
        transaction = null;
        emit(newState);

      case FlatEventUserBook_Reset(items: final items):
        var newState = state.copy();
        newState.items = List<UserBook>.from(items);
        emit(newState);

      case FlatEventUserBook_Delete(start: final start, end: final end):
        if (transaction == null) {
          var newState = state.copy();
          newState.items.removeRange(start.toInt(), end.toInt());
          emit(newState);
        } else {
          transaction!.delete(start, end);
        }

      case FlatEventUserBook_Insert(index: final index, items: var items):
        if (transaction == null) {
          var newState = state.copy();
          newState.items.insertAll(index.toInt(), items);
          emit(newState);
        } else {
          transaction!.insert(index, items);
        }

      case FlatEventUserBook_Update(index: final index, item: final item):
        if (transaction == null) {
          var newState = state.copy();
          newState.items[index.toInt()] = item;
          emit(newState);
        } else {
          transaction!.update(index, item);
        }

      case FlatEventUserBook_Move(start: final start, end: final end, offset: final offset):
        if (transaction == null) {
          var newState = state.copy();
          newState.items.move(start.toInt(), end.toInt(), offset.toInt());
          emit(newState);
        } else {
          transaction!.move(start, end, offset.toInt());
        }
    }
  }
}

class OCTransaction<T> {
  List<T> items;

  OCTransaction(this.items);

  List<T> result() {
    return items;
  }

  void delete(BigInt start, BigInt end) {
    items.removeRange(start.toInt(), end.toInt());
  }

  void insert(BigInt index, List<T> items) {
    this.items.insertAll(index.toInt(), items);
  }

  void update(BigInt index, T item) {
    items[index.toInt()] = item;
  }

  void move(BigInt start, BigInt end, int offset) {
    items.move(start.toInt(), end.toInt(), offset);
  }
}

extension<T> on List<T> {
  void move(int start, int end, int offset) {
    if (offset == 0) {
      return;
    }
    final items = getRange(start.toInt(), end.toInt()).toList(growable: false);
    removeRange(start.toInt(), end.toInt());
    insertAll(start + offset, items);
  }
}
