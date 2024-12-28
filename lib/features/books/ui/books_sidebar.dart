import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksSidebar extends StatefulWidget {
  final GoRouterState state;

  const BooksSidebar({super.key, required this.state});

  @override
  State<BooksSidebar> createState() {
    return _BooksSidebar();
  }
}

class _BooksSidebar extends State<BooksSidebar> {
  String? selection;
  late GoRouteInformationProvider _routeProvider;

  @override
  void initState() {
    _routeProvider = GoRouter.of(context).routeInformationProvider;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _routeProvider.addListener(_updateState);
    selection = widget.state.uri.path;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _routeProvider.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    setState(() {
      final segments = _routeProvider.value.uri.pathSegments;
      if (segments.length > 1) {
        selection = '/${segments[0]}/${segments[1]}';
      } else {
        selection = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text("All"),
            dense: true,
            selected: selection == '/books/all',
            onTap: () => context.go('/books/all'),
          ),
          ListTile(
            title: const Text("Completed"),
            dense: true,
            selected: selection == '/books/complete',
            onTap: () => context.go('/books/complete'),
          ),
        ],
      ),
    );
  }
}
