import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AudioBooksSidebar extends StatefulWidget {
  const AudioBooksSidebar({super.key});

  @override
  State<AudioBooksSidebar> createState() {
    return _AudioBooksSidebar();
  }
}

class _AudioBooksSidebar extends State<AudioBooksSidebar> {
  String? selection;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text("All"),
            dense: true,
            selected: selection == '/audiobooks/all',
            onTap: () => context.go('/audiobooks/all'),
          ),
          ListTile(
            title: const Text("Completed"),
            dense: true,
            selected: selection == '/audiobooks/complete',
            onTap: () => context.go('/audiobooks/complete'),
          ),
        ],
      ),
    );
  }
}
