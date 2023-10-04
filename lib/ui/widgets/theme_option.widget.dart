import 'package:theme_color_chart/constants/settings.dart' as settings;
import 'package:theme_color_chart/constants/theme.enum.dart';
import 'package:theme_color_chart/main.dart';
import 'package:theme_color_chart/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = logger("ThemeOptionWidget");

class ThemeOptionWidget extends StatelessWidget {
  final ThemeEnum themeMode;
  final String title;

  const ThemeOptionWidget({
    super.key,
    required this.themeMode,
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final checked = themeNotifier.value == themeMode;

    return ListTile(
      onTap: () => onThemeTapped(
        context: context,
        themeMode: themeMode,
      ),
      title: Text(
        title,
      ),
      trailing: Icon(
        checked ? Icons.radio_button_checked : Icons.radio_button_unchecked,
      ),
    );
  }

  onThemeTapped({
    required BuildContext context,
    required ThemeEnum themeMode,
  }) {
    _log("onThemeTapped").enum_("themeMode", themeMode).print();

    themeNotifier.value = themeMode;

    SharedPreferences.getInstance().then(
      (
        prefs,
      ) {
        prefs.setString(
          settings.theme,
          themeMode.name,
        );
      },
    );

    Navigator.pop(
      context,
    );
  }
}
