import 'package:theme_color_chart/themes/system.theme.dart';
import 'package:flutter/material.dart';

ThemeData testDark({
  required BuildContext context,
}) =>
    getTheme(
      brightness: Brightness.dark,
      context: context,
      primary: Colors.green,
      onPrimary: Colors.purple,
      onSurface: Colors.deepOrange,
      appBar: Colors.green,
      appBarShadow: Colors.red,
      bottomAppBarShadow: Colors.red,
      canvas: Colors.blue.shade900,
      card: Colors.brown,
      dialogBackground: Colors.deepPurple,
      divider: Colors.pink,
      listTileIcon: Colors.yellow,
      scaffoldBackground: Colors.blue.shade900,
      scrim: Colors.white54,
      shadow: Colors.red,
      snackBarBackground: Colors.red,
      snackBarContent: Colors.blue,
      textBody: Colors.yellow,
      textDisplay: Colors.yellow,
      textButtonForeground: Colors.yellow,
      textFieldLabelBlurred: Colors.yellow,
      textFieldLabelFocused: Colors.green,
    );
