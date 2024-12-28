import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';

class MacosAppbarButtonsPlaceholder extends StatefulWidget {
  const MacosAppbarButtonsPlaceholder({
    super.key,
  });

  @override
  State<MacosAppbarButtonsPlaceholder> createState() => _MacosSpacer();
}

class _MacosSpacer extends State<MacosAppbarButtonsPlaceholder>
    with WindowListener {
  bool isFullScreen = false;

  @override
  void initState() {
    windowManager.addListener(this);
    windowManager.isFullScreen().then((value) {
      isFullScreen = value;
    });
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: isFullScreen ? 0 : 70);
  }

  /// Emitted when the window enters a full-screen state.
  @override
  void onWindowEnterFullScreen() {
    setState(() => isFullScreen = true);
  }

  /// Emitted when the window leaves a full-screen state.
  @override
  void onWindowLeaveFullScreen() {
    setState(() => isFullScreen = false);
  }
}
