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
      progressIndicator: Colors.yellow,
      scaffoldBackground: Colors.blue.shade900,
      scrim: Colors.white54,
      scrollBarColor: Colors.lime,
      scrollBarOverlay: Colors.white,
      shadow: Colors.red,
      snackBarBackground: Colors.red,
      snackBarForeground: Colors.blue,
      splash: Colors.purple.withAlpha(
        128,
      ),
      textBody: Colors.yellow,
      textCursor: Colors.green,
      textDisplay: Colors.lime,
      textButtonForeground: Colors.deepOrange,
      textButtonOverlay: Colors.deepOrange,
      textFieldBorderBlurred: Colors.yellow,
      textFieldBorderFocused: Colors.green,
      textFieldLabelBlurred: Colors.yellow,
      textFieldLabelFocused: Colors.green,
      textSelectionBackground: Colors.pink,
      textSelectionHandle: Colors.pink,
    );
