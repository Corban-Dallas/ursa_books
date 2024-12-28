import 'package:flutter/material.dart';

final typography = Typography.material2021(platform: TargetPlatform.macOS);
const brightness = Brightness.dark;

final ThemeData mainTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.greenAccent, brightness: brightness),
    brightness: brightness);

ThemeData getTheme() {
  var theme = ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: Colors.blue, brightness: brightness),
      brightness: brightness,
      dividerTheme: const DividerThemeData(thickness: 1, space: 1),
      useMaterial3: true);
  return theme;
}
