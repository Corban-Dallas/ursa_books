import 'package:flutter/material.dart';

class ComicsSidebar extends StatefulWidget {
  // final List<GoRoute> routes;

  const ComicsSidebar({super.key});

  @override
  State<ComicsSidebar> createState() {
    return _ComicsSidebar();
  }
}

class _ComicsSidebar extends State<ComicsSidebar> {
  String? selection;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Comics sidebar")),
    );
  }

  void _onTap() {}
}
