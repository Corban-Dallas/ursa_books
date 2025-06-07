// import 'package:flutter/material.dart';
// import 'package:ursa_books/app/portal.dart';
// import 'package:ursa_books/features/books/domain/user_books_repository.dart';
// import 'package:ursa_books/features/books/ui/widgets/book_card.dart';

part of 'books_page.dart';

class BooksListView extends StatelessWidget {
  static double imageMaxWidth = 50;

  final List<UserBook> books;

  final void Function(UserBook) _onTap;

  const BooksListView({super.key, required this.books, onTap}) : _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: books.length, itemBuilder: (context, index) => bookRow(context, books[index]));
  }

  Widget bookRow(BuildContext context, UserBook book) {
    final portal = context.read<Portal>();
    final author = book.book.creatorPersons.firstOrNull?.name;

    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: imageMaxWidth),
        child: BookCard(
          book: book.book,
          imageProvider: portal.previewProvider(book.book.imageIri),
        ),
      ),
      subtitle: author == null ? null : Text(author),
      contentPadding: EdgeInsets.only(top: 4, right: 12, bottom: 4),
      title: Text(book.book.name),
      onTap: () => _onTap(book),
    );
  }
}
