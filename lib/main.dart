import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_color_chart/constants/settings.dart' as settings;
import 'package:theme_color_chart/constants/theme.enum.dart';
import 'package:theme_color_chart/ui/pages/home.page.dart';
import 'package:theme_color_chart/themes/dark.theme.dart';
import 'package:theme_color_chart/themes/light.theme.dart';
import 'package:theme_color_chart/themes/testDark.theme.dart';
import 'package:theme_color_chart/themes/testLight.theme.dart';
import 'package:theme_color_chart/utils/logger.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

// flutter build web --base-href "/theme_color_chart/"
final ValueNotifier<ThemeEnum> themeNotifier = ValueNotifier(
  ThemeEnum.system,
);

final _log = logger("MyApp");

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    SharedPreferences.getInstance().then(
      (
        prefs,
      ) {
        final themeName = prefs.getString(
          settings.theme,
        );

        _log(
          "build SharedPreferences.getInstance",
        )
            .raw(
              "theme",
              themeName,
            )
            .print();

        if (themeName?.isNotEmpty ?? false) {
          var theme = ThemeEnum.values.byName(
            themeName!,
          );

          themeNotifier.value = theme;
        }
      },
    );

    final testThemeLight = testLight(
      context: context,
    );

    final testThemeDark = testDark(
      context: context,
    );

    final themeLight = light(
      context: context,
    );

    final themeDark = dark(
      context: context,
    );

    final themeLightMap = {
      ThemeEnum.light: themeLight,
      ThemeEnum.testLight: testThemeLight,
      ThemeEnum.fromSwatch: ThemeData(
        colorScheme: ColorScheme.fromSwatch(),
      ),
      ThemeEnum.fromSeedBlack: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
      ),
      ThemeEnum.fromSeedWhite: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
      ),
      ThemeEnum.defaultLight: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      ThemeEnum.highContrastLight: ThemeData(
        colorScheme: const ColorScheme.highContrastLight(),
      ),
    };

    final themeDarkMap = {
      ThemeEnum.dark: themeDark,
      ThemeEnum.testDark: testThemeDark,
      ThemeEnum.fromSwatch: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
        ),
      ),
      ThemeEnum.defaultDark: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      ThemeEnum.highContrastDark: ThemeData(
        colorScheme: const ColorScheme.highContrastDark(),
      ),
    };

    return ValueListenableBuilder<ThemeEnum>(
      valueListenable: themeNotifier,
      builder: (
        _,
        themeEnum,
        __,
      ) =>
          MaterialApp(
        title: 'Flutter Demo',
        theme: themeLightMap[themeEnum],
        darkTheme: themeDarkMap[themeEnum],
        themeMode: themeEnum.mode,
        // flutter gen-l10n
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorKey: settings.navigatorState,
        home: const HomePage(),
      ),
    );
  }
}
