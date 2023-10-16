import 'package:flutter/material.dart';

final themeByBrightness = {
  Brightness.dark: ThemeData.dark(),
  Brightness.light: ThemeData.light(),
};

ThemeData getTheme({
  required Brightness brightness,
  required BuildContext context,
  required Color secondary,
  required Color appBarBackground,
  required Color appBarForeground,
  required Color cardBackground,
  required Color dialogBackground,
  required Color divider,
  required Color elevatedButtonBackground,
  required Color hover,
  required Color listTileIconForeground,
  required Color popupMenuBackground,
  required Color progressIndicator,
  required Color scaffoldBackground,
  required Color scrim,
  required Color shadow,
  required Color snackBarBackground,
  required Color snackBarForeground,
  required Color splash,
  required Color textBody,
  required Color textCursor,
  required Color textDisplay,
  required Color textButtonForeground,
  required Color textFieldBorderBlurred,
  required Color textFieldBorderFocused,
  required Color textFieldLabelBlurred,
  required Color textFieldLabelFocused,
  required Color textSelectionBackground,
  required Color textSelectionHandle,
}) {
  final theme = Theme.of(
    context,
  );

  final labelSmallFontSize = theme.textTheme.labelSmall?.fontSize ?? 10.0;

  final inputDecorationBorderSideWidth = labelSmallFontSize / 5;

  return themeByBrightness[brightness]!.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.grey,
    ).copyWith(
      primary: Colors.deepPurple,
      onPrimary: Colors.deepPurple,
      primaryContainer: Colors.deepPurple,
      onPrimaryContainer: Colors.deepPurple,
      inversePrimary: Colors.deepPurple,
      secondary: Colors.deepPurple,
      onSecondary: Colors.deepPurple,
      secondaryContainer: Colors.deepPurple,
      onSecondaryContainer: Colors.deepPurple,
      tertiary: Colors.deepPurple,
      onTertiary: Colors.deepPurple,
      tertiaryContainer: Colors.deepPurple,
      onTertiaryContainer: Colors.deepPurple,
      background: Colors.deepPurple,
      onBackground: Colors.deepPurple,
      error: Colors.deepPurple,
      onError: Colors.deepPurple,
      errorContainer: Colors.deepPurple,
      onErrorContainer: Colors.deepPurple,
      outline: Colors.deepPurple,
      outlineVariant: Colors.deepPurple,
      surface: Colors.deepPurple,
      onSurface: Colors.deepPurple,
      surfaceVariant: Colors.deepPurple,
      onSurfaceVariant: Colors.deepPurple,
      inverseSurface: Colors.deepPurple,
      onInverseSurface: Colors.deepPurple,
      surfaceTint: Colors.deepPurple,
      brightness: brightness,
      shadow: Colors.deepPurple,
      scrim: scrim,
    ),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: appBarForeground,
      ),
      foregroundColor: appBarForeground,
      color: appBarBackground,
      shadowColor: shadow,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      shadowColor: shadow,
    ),
    canvasColor: scaffoldBackground,
    cardColor: cardBackground,
    dialogBackgroundColor: dialogBackground,
    dividerColor: divider,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: appBarForeground,
        backgroundColor: elevatedButtonBackground,
      ),
    ),
    hoverColor: hover,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
        (
          states,
        ) =>
            TextStyle(
          color: states.contains(
            MaterialState.focused,
          )
              ? textFieldLabelFocused
              : textFieldLabelBlurred,
        ),
      ),
      labelStyle: TextStyle(
        color: textFieldLabelBlurred,
      ),
      border: MaterialStateUnderlineInputBorder.resolveWith(
        (
          states,
        ) {
          var color = states.contains(
            MaterialState.focused,
          )
              ? textFieldBorderFocused
              : textFieldBorderBlurred;

          if (states.contains(
            MaterialState.hovered,
          )) {
            color = Color.lerp(
              color,
              appBarForeground,
              0.6,
            )!;
          }

          return UnderlineInputBorder(
            borderSide: BorderSide(
              width: inputDecorationBorderSideWidth,
              color: color,
            ),
          );
        },
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: listTileIconForeground,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: popupMenuBackground,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: progressIndicator,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (
          states,
        ) {
          var color = states.contains(
            MaterialState.selected,
          )
              ? secondary
              : textBody;

          return color;
        },
      ),
    ),
    scaffoldBackgroundColor: scaffoldBackground,
    shadowColor: shadow,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: snackBarBackground,
      contentTextStyle: TextStyle(
        color: snackBarForeground,
      ),
    ),
    splashColor: splash,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: textButtonForeground,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: textCursor,
      selectionColor: textSelectionBackground,
      selectionHandleColor: textSelectionHandle,
    ),
    textTheme: Theme.of(
      context,
    ).textTheme.apply(
          bodyColor: textBody,
          displayColor: textDisplay,
        ),
  );
}
