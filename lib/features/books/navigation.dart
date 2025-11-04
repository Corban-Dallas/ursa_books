import 'package:go_router/go_router.dart';



import 'package:ursa_books/core/layout/split_layout.dart';
import 'package:ursa_books/features/books/ui/books_collection/bloc/books_collection_bloc.dart';
import 'books.dart';

class BooksNavigation {
  // MARK: Root
  static GoRoute root = GoRoute(
      path: '/books',
      pageBuilder: (context, state) => NoTransitionPage(
              child: BooksSidebar(
            state: state,
          )),
      redirect: (_, state) {
        if (state.uri.pathSegments.length > 1) {
          return state.uri.path;
        } else {
          return '/books/all';
        }
      },
      routes: <RouteBase>[
        ShellRoute(
            pageBuilder: (context, state, child) {
              return NoTransitionPage<void>(
                  child: SplitLayout(
                sidebar: BooksSidebar(
                  state: state,
                ),
                details: child,
              ));
            },
            routes: [booksAllRoute, booksCompletedRoute])
      ]);

  // MARK: Books All

  static GoRoute booksAllRoute = GoRoute(
      path: "all",
      name: "All Books",
      pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const BooksCollectionPage(),
          ),
      routes: [bookDetailRoute]);

  // MARK: Books Completed

  static GoRoute booksCompletedRoute = GoRoute(
    path: "complete",
    name: "Complete Books",
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const BooksCompletePage(),
    ),
  );

  // MARK: Book Detail

  static GoRoute bookDetailRoute = GoRoute(
    name: 'BookDetail',
    path: ':bookId',
    builder: (context, state) => BookDetailsPage(
      id: state.pathParameters['bookId'] ?? '',
      book: state.extra as UserBook,
    ),
  );
}
