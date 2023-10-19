import 'package:theme_color_chart/themes/system.theme.dart';
import 'package:flutter/material.dart';

class ParisGreen {
  static const raw = Color.fromARGB(
    255,
    80,
    200,
    120,
  );

  /// Foreground: onPrimary
  /// Background: this
  /// Contrast Ratio: >= 7
  static const primary = Color.fromARGB(
    255,
    32,
    101,
    61,
  );

  /// Foreground: this
  /// Background: scaffoldBackground
  /// Contrast Ratio: >= 7
  static const body = Color.fromARGB(
    255,
    54,
    171,
    104,
  );

  /// Foreground: textBody
  /// Background: this
  /// Contrast Ratio: <= 4.5
  static const selection = Color.fromARGB(
    255,
    18,
    64,
    39,
  );
}

class Chartreuse {
  static const raw = Color.fromARGB(
    255,
    128,
    255,
    0,
  );

  /// Foreground: this
  /// Background: scaffoldBackground
  /// Contrast Ratio: >= 7
  static const body = Color.fromARGB(
    255,
    87,
    173,
    0,
  );
}

ThemeData dark({
  required BuildContext context,
}) =>
    getTheme(
      brightness: Brightness.dark,
      context: context,
      secondary: Chartreuse.body,
      appBarBackground: ParisGreen.primary,
      appBarForeground: Colors.white,
      cardBackground: Colors.grey.shade900,
      dialogBackground: Colors.black,
      divider: Colors.grey.shade800,
      elevatedButtonBackground: ParisGreen.primary,
      hover: Colors.white10,
      listTileIconForeground: Colors.grey.shade500,
      popupMenuBackground: Color.lerp(
        Colors.black,
        ParisGreen.selection,
        0.25,
      )!,
      progressIndicator: ParisGreen.body,
      scaffoldBackground: Colors.black,
      scrim: Colors.black.withAlpha(
        192,
      ),
      scrollBarColor: Colors.grey.shade600,
      scrollBarOverlay: Colors.white,
      shadow: Colors.grey,
      snackBarBackground: Colors.white,
      snackBarForeground: Colors.grey.shade700,
      splash: Colors.white.withAlpha(
        32,
      ),
      textBody: Colors.grey.shade500,
      textCursor: ParisGreen.body,
      textDisplay: Colors.grey.shade600,
      textButtonForeground: ParisGreen.body,
      textButtonOverlay: ParisGreen.primary,
      textFieldBorderBlurred: Colors.grey.shade700,
      textFieldBorderFocused: ParisGreen.body,
      textFieldLabelBlurred: Colors.grey.shade600,
      textFieldLabelFocused: ParisGreen.body,
      textSelectionBackground: ParisGreen.selection,
      textSelectionHandle: Chartreuse.body,
    );
