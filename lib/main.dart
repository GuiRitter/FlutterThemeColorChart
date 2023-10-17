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
  ColorSchemeEnum.customSwatch: ColorScheme.fromSwatch(
    primarySwatch: MaterialColor(
      const Color(
        0xFF50C878,
        // 0xFFe7f7eb,
        // 0xFF006a2a,
      ).value,
      const {
        50: Color(
          0xFFe7f7eb,
        ),
        100: Color(
          0xFFc4ebcf,
        ),
        200: Color(
          0xFF9edeb0,
        ),
        300: Color(
          0xFF73d290,
        ),
        400: Color(
          0xFF50c878,
        ),
        500: Color(
          0xFF24be60,
        ),
        600: Color(
          0xFF19ae55,
        ),
        700: Color(
          0xFF079b49,
        ),
        800: Color(
          0xFF008a3e,
        ),
        900: Color(
          0xFF006a2a,
        ),
      },
    ),
    accentColor: const Color.fromARGB(
      255,
      128,
      255,
      0,
    ),
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    cardColor: Colors.white,
    errorColor: const Color(
      0xFFB00020,
    ),
  ),
  ColorSchemeEnum.customSwatchDark: ColorScheme.fromSwatch(
    primarySwatch: MaterialColor(
      const Color(
        // 0xFF50C878,
        // 0xFFe7f7eb,
        0xFF006a2a,
      ).value,
      const {
        50: Color(
          0xFFe7f7eb,
        ),
        100: Color(
          0xFFc4ebcf,
        ),
        200: Color(
          0xFF9edeb0,
        ),
        300: Color(
          0xFF73d290,
        ),
        400: Color(
          0xFF50c878,
        ),
        500: Color(
          0xFF24be60,
        ),
        600: Color(
          0xFF19ae55,
        ),
        700: Color(
          0xFF079b49,
        ),
        800: Color(
          0xFF008a3e,
        ),
        900: Color(
          0xFF006a2a,
        ),
      },
    ),
    accentColor: const Color.fromARGB(
      255,
      128,
      255,
      0,
    ),
    backgroundColor: const Color(
      0xFF121212,
    ),
    brightness: Brightness.dark,
    cardColor: const Color(
      0xFF121212,
    ),
    errorColor: const Color(
      0xFFCF6679,
    ),
  ),
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
                    (colorSchemeEnum == ColorSchemeEnum.testDark))
                ? ThemeMode.dark
                : ((colorSchemeEnum == ColorSchemeEnum.customLight) ||
                        (colorSchemeEnum == ColorSchemeEnum.testLight))
                    ? ThemeMode.light
                    : darkMode
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
