import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ursa_books/core/appbar/desktop_appbar.dart';

class LaunchPage extends StatelessWidget {
  static GoRoute goRoute = GoRoute(
    path: "/launchScreen",
    name: "LaunchScreen",
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const LaunchPage(),
    ),
  );

  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.blueGrey,
          child: Center(
            child: Lottie.asset('assets/lottie_cube.json', width: 250, backgroundLoading: false),
          ),
        ),
        const DesktopAppbar(
          child: SizedBox.expand(),
        ),
      ]),
    );
  }
}
