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
    174,
    229,
    191,
  );

  /// Foreground: this
  /// Background: scaffoldBackground
  /// Contrast Ratio: >= 7
  static const body = Color.fromARGB(
    255,
    32,
    101,
    58,
  );

  /// Foreground: textBody
  /// Background: this
  /// Contrast Ratio: <= 4.5
  static const selection = Color.fromARGB(
    255,
    54,
    196,
    118,
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
    48,
    97,
    0,
  );
}

ThemeData light({
  required BuildContext context,
}) {
  final theme = Theme.of(
    context,
  );

  return getTheme(
    brightness: Brightness.light,
    context: context,
    secondary: Chartreuse.body,
    appBarBackground: ParisGreen.primary,
    appBarForeground: Colors.grey.shade800, // Colors.grey.shade800,
    cardBackground: Colors.grey.shade300,
    dialogBackground: Colors.white, // Colors.grey.shade300,
    divider: Colors.grey.shade400, // Colors.grey.shade400,
    elevatedButtonBackground: ParisGreen.primary,
    hover: Colors.black12,
    listTileIconForeground: Colors.grey.shade500, // Colors.grey.shade500,
    popupMenuBackground: Color.lerp(
      Colors.white,
      ParisGreen.selection,
      0.05,
    )!,
    scaffoldBackground: Colors.white, // Colors.white,
    scrim: Colors.white.withAlpha(192), // Colors.black54,
    shadow: theme.shadowColor, // theme.shadowColor,
    snackBarBackground: Colors.black, // Colors.black,
    snackBarForeground: Colors.grey.shade500, // Colors.grey.shade500,
    splash: Colors.black.withAlpha(32),
    textBody: Colors.grey.shade800, // Colors.grey.shade800,
    textCursor: ParisGreen.body,
    textDisplay: Colors.grey.shade600, // Colors.grey.shade600,
    textButtonForeground: ParisGreen.body, // Colors.grey.shade800,
    textFieldBorderBlurred: Colors.grey.shade500, // Colors.grey.shade500,
    textFieldBorderFocused: ParisGreen.body,
    textFieldLabelBlurred: Colors.grey.shade800, // Colors.grey.shade800,
    textFieldLabelFocused: ParisGreen.body,
    textSelectionBackground: ParisGreen.selection,
    textSelectionHandle: Chartreuse.body,
  );
}
