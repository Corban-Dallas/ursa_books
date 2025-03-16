import 'package:go_router/go_router.dart';
import 'package:ursa_books/core/layout/split_layout.dart';
import 'audiobooks.dart';

class AudiobooksNavigation {
  // Root
  static GoRoute root = GoRoute(
      path: '/audiobooks',
      redirect: (_, __) => "/audiobooks/all",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: AudioBooksSidebar()),
      routes: <RouteBase>[
        ShellRoute(
            pageBuilder: (context, state, child) {
              return NoTransitionPage<void>(
                  child: SplitLayout(
                sidebar: const AudioBooksSidebar(),
                details: child,
              ));
            },
            routes: [allRoute, completeRoute])
      ]);

  // All

  static GoRoute allRoute = GoRoute(
    path: "all",
    name: "All Audiobooks",
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const AudioBooksPage(),
    ),
  );

  // Complete

  static GoRoute completeRoute = GoRoute(
    path: "complete",
    name: "Complete Audiobooks",
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const AudioBooksCompletePage(),
    ),
  );
}
