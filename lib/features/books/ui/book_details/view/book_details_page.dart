import 'package:flutter/material.dart';
import 'package:ursa_books/app/portal.dart';

import 'package:ursa_books/features/books/domain/user_books_repository.dart';
import 'package:ursa_books/features/books/ui/widgets/book_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../book_details.dart';

class BookDetailsPage extends StatelessWidget {
  final String id;
  final UserBook? _book;

  BookDetailsPage.book({super.key, required UserBook book})
      : id = book.book.id,
        _book = book;

  const BookDetailsPage({super.key, required this.id, UserBook? book}) : _book = book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final ctr = context.read<Portal>().booksCtr();
        final rep = UserBooksRepository(ctr);
        return BookDetailsBloc(booksRepository: rep, id: id, book: _book);
      },
      child: BookDetailsView(),
    );
  }
}

class BookDetailsView extends StatelessWidget {
  BookDetailsView({super.key});

  static double compactLayoutThreshold = 500;
  static double coverMaxWidth = 220;

  @override
  Widget build(BuildContext context) {
    return blocProvider(context,
        builder: (context, state) => LayoutBuilder(builder: (context, constraints) {
              final isWide = constraints.maxWidth > compactLayoutThreshold;
              if (isWide) {
                return wideLayout(context, constraints, state);
              } else {
                return compactLayout(context, constraints, state);
              }
            }));
  }

  Widget blocProvider(BuildContext context, {required BlocWidgetBuilder builder}) {
    return BlocBuilder<BookDetailsBloc, BookDetailsState>(
        builder: (context, state) => BlocListener<BookDetailsBloc, BookDetailsState>(
              listenWhen: (previous, current) => previous.status != current.status && current.status == Status.deleted,
              listener: (context, state) => context.pop(),
              child: builder(context, state),
            ));
  }

  Widget wideLayout(BuildContext context, BoxConstraints constraints, BookDetailsState state) {
    return Scaffold(
        appBar: AppBar(
          title: title(context, state),
          backgroundColor: Colors.transparent,
        ),
        body: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    constraints: BoxConstraints(maxWidth: coverMaxWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        bookImage(context, state),
                        const SizedBox(height: 10),
                        readButton(context),
                        const SizedBox(height: 10),
                        deleteButton(context),
                        const SizedBox(height: 10),
                        completedButton(context, state)
                      ],
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: mainContent2(context, state),
                  )),
                ],
              )),
        ));
  }

  // final _tabControoler = TabController(length: 3, vsync: T)
  final _scrollController = ScrollController();

  // Widget mainContent(BuildContext context, BookDetailsState state) {
  //   if (state.book == null) {
  //     return const Center(
  //       child: Text("Empty data"),
  //     );
  //   }

  //   final theme = Theme.of(context);
  //   return DefaultTabController(
  //     length: 3,
  //     child: NestedScrollView(
  //       floatHeaderSlivers: true,
  //       controller: _scrollController,
  //       headerSliverBuilder: (context, innerBoxIsScrolled) => [
  //         SliverToBoxAdapter(
  //           child: Text(
  //             state.book!.book.name,
  //             style: theme.textTheme.headlineMedium,
  //           ),
  //         ),
  //         const SliverToBoxAdapter(
  //           child: Padding(
  //             padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
  //             child: TabBar(
  //               isScrollable: true,
  //               tabAlignment: TabAlignment.start,
  //               labelPadding: EdgeInsets.all(10),
  //               tabs: [Text("Description"), Text("Content"), Text("Bookmarks")],
  //             ),
  //           ),
  //         ),
  //       ],s
  //       body: TabBarView(children: [
  //         dicription(state.book!.book),
  //         bookContent(),
  //         bookmarks(),
  //       ]),
  //     ),
  //   );
  // }

  Widget mainContent2(BuildContext context, BookDetailsState state) {
    if (state.book == null) {
      return const Center(
        child: Text("Empty data"),
      );
    }

    return DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title(context, state),
            tabs(),
            // tabsContent(context, state.book!.book),
            Expanded(
              child: TabBarView(children: [
                dicription(state.book!.book),
                bookContent(),
                bookmarks(),
              ]),
            )
          ],
        ));
  }

  Text title(BuildContext context, state) {
    final theme = Theme.of(context);
    return Text(
      state.book!.book.name,
      style: theme.textTheme.headlineMedium,
    );
  }

  Padding tabs() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.all(10),
        tabs: [Text("Description"), Text("Content"), Text("Bookmarks")],
      ),
    );
  }

  // Widget tabsContent(BuildContext context, Book book) {
  //   return Column(
  //     children: [
  //       const Padding(
  //         padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
  //         child: TabBar(
  //           isScrollable: true,
  //           tabAlignment: TabAlignment.start,
  //           tabs: [Text("Description"), Text("Content"), Text("Bookmarks")],
  //         ),
  //       ),
  //       TabBarView(children: [
  //         dicription(book),
  //         bookContent(),
  //         bookmarks(),
  //       ]),
  //     ],
  //   );
  // }

  Widget dicription(Book book) {
    return Text(book.description);
  }

  Widget bookContent() {
    return const Text("Content");
  }

  Widget bookmarks() {
    return const Text("Bookmarks");
  }

  Widget bookImage(BuildContext context, BookDetailsState state) {
    final portal = context.read<Portal>();

    return (state.book == null)
        ? const Text("No cover")
        : BookCard(
            book: state.book!.book,
            imageProvider: portal.imageProvider(state.book!.book.imageIri),
          );
  }

  Widget readButton(BuildContext context) {
    return OutlinedButton(
      child: const Text("Read"),
      onPressed: () => {},
    );
  }

  Widget completedButton(BuildContext context, BookDetailsState state) {
    final completed = state.book?.userData?.completed ?? false;

    return OutlinedButton(
        child: Text(completed ? "Completed" : "Uncompleted"),
        onPressed: () => context.read<BookDetailsBloc>().add(const BookDetailsCompleteToogled()));
  }

  Widget deleteButton(BuildContext context) {
    return OutlinedButton(
      child: const Text("Delete"),
      onPressed: () => context.read<BookDetailsBloc>().add(const BookDetailsTapDelete()),
    );
  }

  Widget compactLayout(BuildContext context, BoxConstraints constraints, BookDetailsState state) {
    return const Text("Compact layout");
  }
}
