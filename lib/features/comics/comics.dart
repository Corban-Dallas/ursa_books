import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:ursa_books/core/activity/activity.dart';
import 'comics_sidebar.dart';

class Comics {
  static Activity activity = Activity(icon: CupertinoIcons.ant, entryRoute: entryGoRoute, entryPath: '/comics');

  static GoRoute entryGoRoute = GoRoute(
    path: '/comics',
    pageBuilder: (context, state) {
      return const NoTransitionPage(child: ComicsSidebar());
    },
  );
}
