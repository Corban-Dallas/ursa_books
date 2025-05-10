import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:ursa_books/features/books/domain/user_books_repository.dart';
import 'package:ursa_books/features/books/ui/books_collection/view/books_list_view.dart';
import 'package:ursa_books/features/books/ui/widgets/book_card.dart';

import '../bloc/books_collection_bloc.dart';
import '../bloc/book_import_cubit.dart';

class BooksCollectionPage extends StatelessWidget {
  const BooksCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BooksListBloc>(
        create: (BuildContext context) => BooksListBloc(context.read<UserBooksRepository>()),
      ),
      BlocProvider<BookImportCubit>(
        create: (BuildContext context) => BookImportCubit(context.read<UserBooksRepository>()),
      ),
    ], child: const BooksCollection());
  }
}

class BooksCollection extends StatefulWidget {
  const BooksCollection({super.key});

  @override
  State<BooksCollection> createState() => _BooksCollection();
}

class _BooksCollection extends State<BooksCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: BlocBuilder<BooksListBloc, BooksCollectionState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: state.isList ? booksList(context, state.items) : booksGrid(context, state.items),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<BookImportCubit>().importBook,
        child: const Icon(CupertinoIcons.plus),
      ),
    );
  }

  Widget booksList(BuildContext context, List<UserBook> books) {
    return BooksListView(books: books, onTap: (book) => _onBookTap(context, book));
  }

  Widget booksGrid(BuildContext context, List<UserBook> books) {
    const double itemAspectRatio = 0.64;
    const double itemMaxWidth = 240;
    const double itemMaxHeight = itemMaxWidth / itemAspectRatio;

    return GridView.extent(
        maxCrossAxisExtent: itemMaxWidth,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        childAspectRatio: itemAspectRatio,
        children: List.generate(books.length, (index) {
          return GestureDetector(
              child: Hero(
                  tag: books[index].book.id,
                  child: BookCard(
                    book: books[index].book,
                    imageMaxWidth: itemMaxWidth,
                    imageMaxHeight: itemMaxHeight,
                  )),
              onTap: () => _onBookTap(context, books[index]));
        }));
  }

  Widget addBookButton(BuildContext context) {
    return IconButton(onPressed: context.read<BookImportCubit>().importBook, icon: const Icon(CupertinoIcons.plus));
  }

  void _onBookTap(BuildContext context, UserBook book) {
    final routeProvider = GoRouter.of(context).routeInformationProvider;
    final location = routeProvider.value.uri.path;
    final bookId = book.book.id;
    context.go('$location/$bookId', extra: book);
  }
}
