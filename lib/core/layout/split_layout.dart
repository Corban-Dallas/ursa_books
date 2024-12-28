import 'package:flutter/material.dart';

class SplitLayout extends StatelessWidget {
  final Widget sidebar;
  final Widget? details;

  final sidebarMaxWidth = 240.0;

  const SplitLayout({super.key, required this.sidebar, this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: sidebarMaxWidth,
          ),
          child: sidebar,
        ),
        const VerticalDivider(),
        Expanded(child: prepareDetails())
      ],
    );
  }

  Widget prepareDetails() {
    return details ??
        const Center(
          child: Text("Empty Details"),
        );
  }
}
