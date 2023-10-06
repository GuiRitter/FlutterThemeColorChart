import 'package:flutter/material.dart';

enum ThemeEnum {
  dark(
    mode: ThemeMode.dark,
  ),
  light(
    mode: ThemeMode.light,
  ),
  system(
    mode: ThemeMode.system,
  ),
  testDark(
    mode: ThemeMode.dark,
  ),
  testLight(
    mode: ThemeMode.light,
  ),
  fromSwatch(
    mode: ThemeMode.light,
  ),
  fromSeedBlack(
    mode: ThemeMode.light,
  ),
  fromSeedWhite(
    mode: ThemeMode.light,
  ),
  defaultLight(
    mode: ThemeMode.light,
  ),
  highContrastLight(
    mode: ThemeMode.light,
  ),
  highContrastDark(
    mode: ThemeMode.dark,
  ),
  defaultDark(
    mode: ThemeMode.dark,
  ),
  fromSwatchDark(
    mode: ThemeMode.dark,
  );

  final ThemeMode mode;

  const ThemeEnum({
    required this.mode,
  });

  ThemeEnum get notTest => ThemeEnum.values.byName(
        mode.name,
      );
}
