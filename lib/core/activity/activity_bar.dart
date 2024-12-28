import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ursa_books/core/activity/activity.dart';

class ActivityBar extends StatefulWidget {
  final List<Activity> activities;

  const ActivityBar({super.key, required this.activities});

  @override
  State<StatefulWidget> createState() => _ActivityBar();
}

class _ActivityBar extends State<ActivityBar> {
  String selection = '';

  final double _width = 50;
  late GoRouteInformationProvider _routeProvider;

  @override
  void initState() {
    super.initState();

    _routeProvider = GoRouter.of(context).routeInformationProvider;
    _routeProvider.addListener(_updateState);

    final uri = _routeProvider.value.uri;
    final segments = uri.pathSegments;
    selection = segments.isNotEmpty ? '/${segments[0]}' : '';
  }

  @override
  void didChangeDependencies() {
    // _routeProvider.addListener(_updateState);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _routeProvider.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    final uri = _routeProvider.value.uri;
    final segments = uri.pathSegments;
    setState(() {
      selection = segments.isNotEmpty ? '/${segments[0]}' : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: prepareButtons(context)),
      ),
    );
  }

  List<Widget> prepareButtons(BuildContext context) {
    List<Widget> list = [];

    for (final activity in widget.activities) {
      final button = IconButton(
        icon: Icon(activity.icon),
        iconSize: 24,
        isSelected: selection == activity.entryPath,
        onPressed: () => context.go(activity.entryPath),
      );
      list.add(button);
    }

    return list;
  }
}
