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

          if ((!kDebugMode) && theme.isTest) {
            theme = theme.notTest;

            prefs.setString(
              settings.theme,
              theme.name,
            );
          }

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

    return ValueListenableBuilder<ThemeEnum>(
      valueListenable: themeNotifier,
      builder: (
        _,
        themeMode,
        __,
      ) =>
          MaterialApp(
        title: 'Flutter Demo',
        theme: (kDebugMode && (themeMode == ThemeEnum.testLight))
            ? testThemeLight
            : themeLight,
        darkTheme: (kDebugMode && (themeMode == ThemeEnum.testDark))
            ? testThemeDark
            : themeDark,
        themeMode: themeMode.mode,
        // flutter gen-l10n
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorKey: settings.navigatorState,
        home: const HomePage(),
      ),
    );
  }
}
