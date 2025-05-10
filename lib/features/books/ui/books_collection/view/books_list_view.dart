import 'package:flutter/material.dart';
import 'package:ursa_books/features/books/domain/user_books_repository.dart';
import 'package:ursa_books/features/books/ui/widgets/book_card.dart';

import 'view.dart';

class BooksListView extends StatelessWidget {
  final List<UserBook> books;

  final void Function(UserBook) _onTap;

  static double imageMaxHeight = 40;

  const BooksListView({super.key, required this.books, onTap}) : _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              width: 50,
              child: BookCard(
                book: books[index].book,
                // imageMaxHeight: imageMaxHeight,
                // imageMaxWidth: 40,
              ),
            ),
            title: Text(books[index].book.name),
            onTap: () => _onTap(books[index]),
          );
        });
  }
}

// class BooksListView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

// class BooksListState extends State<BooksListView> {
//   List<UserBook> books;

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
