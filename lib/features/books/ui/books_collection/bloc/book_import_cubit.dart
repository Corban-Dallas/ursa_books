// part of 'books_list_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ursa_books/data/rust/api/books.dart';

class BookImportCubit extends Cubit<void> {

  final ArkBooks ctr;

  BookImportCubit(this.ctr) : super(());

  Future<void> importBook() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ["epub"]);
    if (result == null) return;
    final path = result.files.first.path;
    if (path == null) return;
    await ctr.storeEpubBook(path: path);
  }
}
