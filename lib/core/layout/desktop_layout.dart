import 'package:flutter/material.dart';
import 'package:ursa_books/core/appbar/desktop_appbar.dart';
import 'package:ursa_books/core/activity/activity.dart';

enum Layout { compact, medium, expanded }

class DesktopLayout extends StatelessWidget {
  final List<Activity> activities;

  final Widget content;

  const DesktopLayout(
      {super.key, required this.activities, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          const DesktopAppbar(
            child: SizedBox.expand(),
          ),
          const Divider(),
          Expanded(
            child: ActivityContainer(activities: activities, content: content),
          )
        ],
      ),
    );
  }
}
