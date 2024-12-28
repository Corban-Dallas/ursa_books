import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export './activity_bar.dart';
export './activity_container.dart';

class Activity {
  final IconData icon;
  final RouteBase entryRoute;
  final String entryPath;

  const Activity(
      {required this.icon, required this.entryRoute, required this.entryPath});
}
