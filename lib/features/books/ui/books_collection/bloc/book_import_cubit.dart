part of 'bloc.dart';

class BookImportCubit extends Cubit<void> {
  final UserBooksRepository repository;

  BookImportCubit(this.repository) : super(());

  Future<void> importBook() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["epub"]);
    if (result == null) return;
    final path = result.files.first.path;
    if (path == null) return;
    await repository.importBook(path);
  }
}
