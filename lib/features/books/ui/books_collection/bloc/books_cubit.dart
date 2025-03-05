part of 'bloc.dart';

class BooksCubit extends Cubit<List<UserBook>> {
  final UserBooksRepository repository;

  BooksCubit(this.repository) : super([]) {
    repository.subscribe(emit);
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
}
