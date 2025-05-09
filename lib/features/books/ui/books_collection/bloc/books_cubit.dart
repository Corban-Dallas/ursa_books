part of 'bloc.dart';

class BooksCubit extends Cubit<List<UserBook>> {
  OCTransaction<UserBook>? transaction;

  final UserBooksRepository repository;

  BooksCubit(this.repository) : super([]) {
    repository.subscribe(handleOcEvent);
  }

  Future<Uint8List?> getCover(String urn, [int? width, int? height]) {
    return repository.getCover(urn, width, height);
  }

  @override
  void onChange(Change<List<UserBook>> change) {
    super.onChange(change);
  }

  @override
  Future<void> close() async {
    repository.unsubscribe();
    return super.close();
  }

  void handleOcEvent(FlatEventUserBook event) {
    switch (event) {
      case FlatEventUserBook_BeginTasnsaction():
        if (transaction != null) {
          throw AssertionError("Transaction already exist");
        }
        transaction = OCTransaction(state);

      case FlatEventUserBook_FinishTransaction():
        emit(transaction!.result());
        transaction = null;

      case FlatEventUserBook_Reset(items: final items):
        final books = List<UserBook>.from(items);
        emit(books);

      case FlatEventUserBook_Delete(start: final start, end: final end):
        if (transaction == null) {
          var items = state;
          items.removeRange(start.toInt(), end.toInt());
          emit(items);
        } else {
          transaction!.delete(start, end);
        }

      case FlatEventUserBook_Insert(index: final index, items: var items):
        if (transaction == null) {
          var newItems = List<UserBook>.from(state);
          newItems.insertAll(index.toInt(), items);
          emit(newItems);
        } else {
          transaction!.insert(index, items);
        }

      case FlatEventUserBook_Update(index: final index, item: final item):
        if (transaction == null) {
          var items = state;
          items[index.toInt()] = item;
          emit(items);
        } else {
          transaction!.update(index, item);
        }

      case FlatEventUserBook_Move(start: final start, end: final end, offset: final offset):
        if (transaction == null) {
          var items = state;
          items.move(start.toInt(), end.toInt(), offset);
          emit(items);
        } else {
          transaction!.move(start, end, offset);
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
