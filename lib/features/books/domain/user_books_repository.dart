import 'package:ursa_books/data/rust/api/oc_observer.dart';
import 'package:ursa_books/data/rust/api/books.dart';
import 'package:ursa_books/data/rust/api/user_books.dart';

export 'package:ursa_books/data/rust/api/user_books.dart';

class UserBooksRepository {
  final ArkBooks _ctr;
  UserBooksCollection? _oc;
  OcSubscription? _subscription;

  UserBooksRepository(this._ctr);

  Future<void> subscribe(void Function(FlatEventUserBook) callback) async {
    _oc = await _ctr.createUserCollection();
    await _oc!.subscribe(callback: callback);
  }

  void unsubscribe() {
    _subscription?.dispose();
    _subscription = null;
    _oc?.dispose();
    _oc = null;
  }

  Future<void> importBook(String path) async {
    await _ctr.storeEpubBook(path: path);
  }

  Future<void> delete(String id) async {
    await _ctr.delete(id: id);
  }

  Future<void> setCompleted(bool completed, String id) async {
    await _ctr.setCompleted(completed: completed, bookId: id);
  }
}
