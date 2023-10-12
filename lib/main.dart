import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme_color_chart/constants/color_scheme.enum.dart';
import 'package:theme_color_chart/constants/settings.dart' as settings;
import 'package:theme_color_chart/constants/theme.enum.dart';
import 'package:theme_color_chart/constants/theme_data.enum.dart';
import 'package:theme_color_chart/ui/pages/home.page.dart';
import 'package:theme_color_chart/themes/dark.theme.dart' as custom_theme;
import 'package:theme_color_chart/themes/light.theme.dart' as custom_theme;
import 'package:theme_color_chart/themes/testDark.theme.dart' as custom_theme;
import 'package:theme_color_chart/themes/testLight.theme.dart' as custom_theme;

void main() {
  runApp(
    const MyApp(),
  );
}

// flutter build web --base-href "/theme_color_chart/"

final ValueNotifier<ThemeDataEnum> themeDataNotifier = ValueNotifier(
  ThemeDataEnum.system,
);

final ValueNotifier<ColorSchemeEnum> colorSchemeNotifier = ValueNotifier(
  ColorSchemeEnum.customDark,
);

final ValueNotifier<bool> darkModeNotifier = ValueNotifier(
  true,
);

final ValueNotifier<ThemeEnum> themeNotifier = ValueNotifier(
  ThemeEnum.system,
);

final colorSchemeMap = {
  ColorSchemeEnum.fromSwatch: ColorScheme.fromSwatch(),
  ColorSchemeEnum.fromSeedBlack: ColorScheme.fromSeed(seedColor: Colors.black),
  ColorSchemeEnum.fromSeedWhite: ColorScheme.fromSeed(seedColor: Colors.white),
  ColorSchemeEnum.light: const ColorScheme.light(),
  ColorSchemeEnum.highContrastLight: const ColorScheme.highContrastLight(),
  ColorSchemeEnum.highContrastDark: const ColorScheme.highContrastDark(),
  ColorSchemeEnum.dark: const ColorScheme.dark(),
  ColorSchemeEnum.fromSwatchDark:
      ColorScheme.fromSwatch(brightness: Brightness.dark),
};

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return ValueListenableBuilder<ThemeDataEnum>(
      valueListenable: themeDataNotifier,
      builder: (
        _,
        themeDataEnum,
        __,
      ) =>
          ValueListenableBuilder(
        valueListenable: colorSchemeNotifier,
        builder: (
          ___,
          colorSchemeEnum,
          ____,
        ) =>
            ValueListenableBuilder(
          valueListenable: darkModeNotifier,
          builder: (
            _____,
            darkMode,
            ______,
          ) =>
              MaterialApp(
            title: 'Theme Color Chart',
            onGenerateTitle: (
              context,
            ) {
              final l10n = AppLocalizations.of(
                context,
              )!;

              return l10n.title;
            },
            theme: (colorSchemeEnum == ColorSchemeEnum.customLight)
                ? custom_theme.light(context: context)
                : (colorSchemeEnum == ColorSchemeEnum.testLight)
                    ? custom_theme.testLight(context: context)
                    : getTheme(),
            darkTheme: (colorSchemeEnum == ColorSchemeEnum.customDark)
                ? custom_theme.dark(context: context)
                : (colorSchemeEnum == ColorSchemeEnum.testDark)
                    ? custom_theme.testDark(context: context)
                    : getTheme(),
            themeMode: ((colorSchemeEnum == ColorSchemeEnum.customDark) ||
                    (colorSchemeEnum == ColorSchemeEnum.testDark) ||
                    darkMode)
                ? ThemeMode.dark
                : ThemeMode.light,
            // flutter gen-l10n
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            navigatorKey: settings.navigatorState,
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }

  ThemeData? getTheme() {
    final colorScheme =
        ((colorSchemeNotifier.value == ColorSchemeEnum.customLight) ||
                (colorSchemeNotifier.value == ColorSchemeEnum.testLight) ||
                (colorSchemeNotifier.value == ColorSchemeEnum.customDark) ||
                (colorSchemeNotifier.value == ColorSchemeEnum.testDark))
            ? null
            : colorSchemeMap[colorSchemeNotifier.value]!.copyWith(
                scrim: Colors.black54,
              );

    return (themeDataNotifier.value == ThemeDataEnum.dark)
        ? ThemeData.dark().copyWith(
            colorScheme: colorScheme,
          )
        : (themeDataNotifier.value == ThemeDataEnum.light)
            ? ThemeData.light().copyWith(
                colorScheme: colorScheme,
              )
            : ThemeData().copyWith(
                colorScheme: colorScheme,
              );
  }
}
