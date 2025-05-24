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

    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: imageMaxWidth),
        child: BookCard(
          book: book.book,
          imageProvider: portal.imageProvider(book.book.imageIri),
        ),
      ),
      trailing: Text(book.book.creatorPersons.firstOrNull?.name ?? ""),
      contentPadding: EdgeInsets.only(top: 5, bottom: 5),
      title: Text(book.book.name),
      onTap: () => _onTap(book),
    );
  }
}
