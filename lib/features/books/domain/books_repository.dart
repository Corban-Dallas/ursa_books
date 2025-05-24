import 'package:ursa_books/data/rust/api/oc_observer.dart';
import 'package:ursa_books/data/rust/api/books.dart';

class BooksRepository {
  final ArkBooks _ctr;
  BooksObservableCollection? _oc;
  OcSubscription? _subscription;

  BooksRepository(this._ctr);

  Future<void> subscribe(void Function(FlatEventBook) callback) async {
    _oc = await _ctr.createCollection();
    _subscription = await _oc!.subscribe(callback: (event) => callback(event));
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
}
