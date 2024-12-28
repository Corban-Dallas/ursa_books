import 'package:flutter/material.dart';
import 'package:platform/platform.dart';

import 'package:window_manager/window_manager.dart';

import 'windows_appbar.dart';
import 'macos_spacer.dart';

class DesktopAppbar extends StatelessWidget implements PreferredSizeWidget {
  static const platform = LocalPlatform();
  final Widget child;

  const DesktopAppbar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, child: wrappedBody(child));
  }

  Widget wrappedBody(Widget body) {
    switch (platform.operatingSystem) {
      case Platform.windows:
        return Row(children: [
          Expanded(child: DragToMoveArea(child: body)),
          const WindowsAppbarButtons()
        ]);
      case Platform.macOS:
        return Row(children: [
          const MacosAppbarButtonsPlaceholder(),
          Expanded(child: body)
        ]);
      default:
        return body;
    }
  }

  static double get height {
    switch (platform.operatingSystem) {
      case Platform.windows:
        return 38;
      case Platform.macOS:
        return 38;
      default:
        return 32;
    }
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}
