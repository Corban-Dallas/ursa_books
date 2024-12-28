import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';

class WindowsAppbarButtons extends StatefulWidget {
  const WindowsAppbarButtons({
    super.key,
    this.backgroundColor,
  });

  // final Widget body;
  final Color? backgroundColor;

  @override
  State<WindowsAppbarButtons> createState() => _WindowCaptionState();
}

class _WindowCaptionState extends State<WindowsAppbarButtons>
    with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          WindowCaptionButton.minimize(
            brightness: brightness,
            onPressed: () async {
              bool isMinimized = await windowManager.isMinimized();
              if (isMinimized) {
                windowManager.restore();
              } else {
                windowManager.minimize();
              }
            },
          ),
          FutureBuilder<bool>(
            future: windowManager.isMaximized(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data == true) {
                return WindowCaptionButton.unmaximize(
                  brightness: brightness,
                  onPressed: windowManager.unmaximize,
                );
              }
              return WindowCaptionButton.maximize(
                brightness: brightness,
                onPressed: windowManager.maximize,
              );
            },
          ),
          WindowCaptionButton.close(
            brightness: brightness,
            onPressed: windowManager.close,
          ),
        ],
      ),
    );
  }

  @override
  void onWindowMaximize() {
    setState(() {});
  }

  @override
  void onWindowUnmaximize() {
    setState(() {});
  }
}
