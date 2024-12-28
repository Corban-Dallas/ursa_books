import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ursa_books/core/activity/activity.dart';
import 'package:ursa_books/core/layout/desktop_layout.dart';

class AppRouter {
  late final GoRouter router;
  late final ValueNotifier<RoutingConfig> routingConfig;

  final List<Activity> activities;

  AppRouter({required this.activities}) {
    final config = RoutingConfig(routes: [
      GoRoute(
        path: "/",
        redirect: (_, __) => '/books',
      ),
      ShellRoute(
          pageBuilder: (context, state, child) => NoTransitionPage<void>(
              key: state.pageKey,
              child: DesktopLayout(
                activities: activities,
                content: child,
              )),
          routes: activities
              .map(
                (e) => e.entryRoute,
              )
              .toList())
    ]);

    routingConfig = ValueNotifier(config);

    router = GoRouter.routingConfig(routingConfig: routingConfig);
  }
}
