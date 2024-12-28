import 'package:flutter/material.dart';
import 'package:ursa_books/core/activity/activity.dart';

class ActivityContainer extends StatelessWidget {
  final Widget content;
  final List<Activity> activities;

  const ActivityContainer({super.key, required this.activities, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActivityBar(activities: activities),
        const VerticalDivider(),
        Expanded(
          child: content,
        )
      ],
    );
  }
}
