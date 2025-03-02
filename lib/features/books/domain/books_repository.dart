import 'dart:collection';
import 'dart:typed_data';

import 'package:ursa_books/data/rust/third_party/ark_backend_api/creative_work/book.dart';
import 'package:ursa_books/data/rust/api/books.dart';
import 'package:ursa_books/data/rust/third_party/ark_application/file_storage/images.dart';

class BooksRepository {
  final ArkBooks _ctr;
  BooksCollection? _oc;
  BookSubscription? _subscription;

  // Covers cache
  final Map<String, (bool, Uint8List?)> _covers = HashMap();

  BooksRepository(this._ctr) {
    // createMoks();
  }

  Future<void> subscribe(void Function(List<Book>) callback) async {
    _oc = await _ctr.createCollection();
    _subscription = await _oc!.subscribe(f: callback);
  }

  void unsubscribe() {
    _subscription?.dispose();
    _subscription = null;
    _oc?.dispose();
    _oc = null;
  }

  Future<Uint8List?> getCover(String urn, [int? width, int? height]) async {
    final params = ImageParams(width: width?.toInt(), height: height?.toInt(), fill: false);
    if (_covers[urn] == null) {
      final cover = await _ctr.getCover(urn: urn, params: params);
      _covers[urn] = (true, cover);
      return cover;
    } else {
      return _covers[urn]?.$2;
    }
  }

  Future<String> getContent(String fileUrn) async {
    return await _ctr.getBookStr(urn: fileUrn);
  }

  Future<void> importBook(String path) async {
    await _ctr.storeEpubBook(path: path);
  }

  Future<void> delete(String id) async {
    await _ctr.delete(id: id);
  }

  // Mocks

  // Future<void> createMoks() async {
  //   const draft = BookDraft(
  //       title: "Dune",
  //       authors: ["Frank Herbert"],
  //       number: "1",
  //       numberType: 0,
  //       imageUrn: "placeholder",
  //       fileUrn: "placeholdder");

  //   await _ctr.create(draft: draft);

  //   const dune2 = BookDraft(
  //       title: "Dune 2",
  //       authors: ["Frank Herbert"],
  //       number: "2",
  //       numberType: 0,
  //       imageUrn: "placeholder",
  //       fileUrn: "placeholdder");

  //   await _ctr.create(draft: dune2);
  // }
}
