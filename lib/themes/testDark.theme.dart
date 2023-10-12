import 'package:theme_color_chart/themes/system.theme.dart';
import 'package:flutter/material.dart';

ThemeData testDark({
  required BuildContext context,
}) =>
    getTheme(
      brightness: Brightness.dark,
      context: context,
      secondary: Colors.yellow,
      appBarBackground: Colors.green,
      appBarForeground: Colors.purple,
      cardBackground: Colors.brown,
      dialogBackground: Colors.deepPurple,
      divider: Colors.pink,
      elevatedButtonBackground: Colors.green,
      hover: Colors.black,
      listTileIconForeground: Colors.yellow,
      popupMenuBackground: Colors.brown,
      scaffoldBackground: Colors.blue.shade900,
      scrim: Colors.white54,
      selectionBackground: Colors.pink,
      shadow: Colors.red,
      snackBarBackground: Colors.red,
      snackBarForeground: Colors.blue,
      splash: Colors.white.withAlpha(32),
      textBody: Colors.yellow,
      textCursor: Colors.green,
      textDisplay: Colors.yellow,
      textButtonForeground: Colors.yellow,
      textFieldBorderBlurred: Colors.green,
      textFieldBorderFocused: Colors.green,
      textFieldLabelBlurred: Colors.yellow,
      textFieldLabelFocused: Colors.green,
    );
