import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme_color_chart/constants/app_bar_popup_menu.enum.dart';
import 'package:theme_color_chart/constants/settings.dart';
import 'package:theme_color_chart/constants/theme.enum.dart';
import 'package:theme_color_chart/dialogs.dart';
import 'package:theme_color_chart/main.dart';
import 'package:theme_color_chart/ui/widgets/theme_option.widget.dart';
import 'package:theme_color_chart/utils/logger.dart';

final GlobalKey _appBarKey = GlobalKey();

final _log = logger("AppBarWidget");

const shadow = Shadow(
  offset: Offset(
    0.0,
    0.0,
  ),
  blurRadius: 4,
  color: Color.fromARGB(
    255,
    0,
    0,
    0,
  ),
);

AppBar build() {
  final l10n = AppLocalizations.of(
    navigatorState.currentContext!,
  )!;

  return AppBar(
    key: _appBarKey,
    title: Text(
      l10n.title,
    ),
    actions: [
      IconButton(
        onPressed: () {
          var index = ThemeEnum.values.indexOf(
                themeNotifier.value,
              ) -
              1;

          if (index < 0) {
            index = ThemeEnum.values.length - 1;
          }

          themeNotifier.value = ThemeEnum.values[index];
        },
        icon: const Icon(
          Icons.chevron_left,
        ),
      ),
      TextButton(
        onPressed: () {},
        child: ValueListenableBuilder(
          valueListenable: themeNotifier,
          builder: (_, value, __) => Stack(
            children: [
              // Image.asset(
              //   'assets/checkered.png',
              //   repeat: ImageRepeat.repeat,
              // ),
              Text(
                value.name,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    shadow,
                    shadow,
                    shadow,
                    shadow,
                    shadow,
                    shadow,
                    shadow,
                    shadow,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          var index = ThemeEnum.values.indexOf(
                themeNotifier.value,
              ) +
              1;

          if (index >= (ThemeEnum.values.length - 1)) {
            index = 0;
          }

          themeNotifier.value = ThemeEnum.values[index];
        },
        icon: const Icon(
          Icons.chevron_right,
        ),
      ),
      PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem<AppBarPopupMenuEnum>(
            value: AppBarPopupMenuEnum.theme,
            child: Text(
              l10n.appTheme,
            ),
          )
        ],
        onSelected: (
          value,
        ) =>
            onHomePopupMenuItemPressed(
          value: value,
        ),
      )
    ],
  );
}

Future<double> getElevation({
  required int delay,
}) async {
  _log("getAppBarElevation").raw("delay", delay).print();

  await Future.delayed(
    Duration(
      microseconds: delay,
    ),
  );

  final BuildContext? context = _appBarKey.currentContext;

  if (context != null) {
    final statefulElement = context as StatefulElement;

    SingleChildRenderObjectElement? singleChildRenderObjectElement;

    statefulElement.visitChildElements(
      (
        element,
      ) {
        singleChildRenderObjectElement =
            element as SingleChildRenderObjectElement;
      },
    );

    final semantics = singleChildRenderObjectElement!.widget as Semantics;

    final annotatedRegion = semantics.child as AnnotatedRegion;

    final material = annotatedRegion.child as Material;

    return material.elevation;
  } else {
    return await getElevation(
      delay: delay + 1,
    );
  }
}

onHomePopupMenuItemPressed({
  required AppBarPopupMenuEnum value,
}) {
  _log("onHomePopupMenuItemPressed").enum_("value", value).print();

  final l10n = AppLocalizations.of(
    navigatorState.currentContext!,
  )!;

  switch (value) {
    case AppBarPopupMenuEnum.theme:
      showDialog(
        context: navigatorState.currentContext!,
        builder: (
          context,
        ) {
          final optionList = [
            ThemeOptionWidget(
              themeMode: ThemeEnum.dark,
              title: l10n.darkTheme,
            ),
            ThemeOptionWidget(
              themeMode: ThemeEnum.light,
              title: l10n.lightTheme,
            ),
            ThemeOptionWidget(
              themeMode: ThemeEnum.testDark,
              title: l10n.testDarkTheme,
            ),
            ThemeOptionWidget(
              themeMode: ThemeEnum.testLight,
              title: l10n.testLightTheme,
            ),
            ThemeOptionWidget(
              themeMode: ThemeEnum.system,
              title: l10n.systemTheme,
            ),
            const ThemeOptionWidget(
              themeMode: ThemeEnum.fromSwatch,
              title: "fromSwatch",
            ),
            const ThemeOptionWidget(
              themeMode: ThemeEnum.fromSeedBlack,
              title: "fromSeedBlack",
            ),
            const ThemeOptionWidget(
              themeMode: ThemeEnum.fromSeedWhite,
              title: "fromSeedWhite",
            ),
            const ThemeOptionWidget(
              themeMode: ThemeEnum.defaultLight,
              title: "defaultLight",
            ),
            const ThemeOptionWidget(
              themeMode: ThemeEnum.highContrastLight,
              title: "highContrastLight",
            ),
            const ThemeOptionWidget(
              themeMode: ThemeEnum.highContrastDark,
              title: "highContrastDark",
            ),
            const ThemeOptionWidget(
              themeMode: ThemeEnum.defaultDark,
              title: "defaultDark",
            ),
            const ThemeOptionWidget(
              themeMode: ThemeEnum.fromSwatchDark,
              title: "fromSwatchDark",
            ),
          ];

          return AlertDialog(
            title: Text(
              l10n.chooseTheme,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: optionList,
            ),
            actions: [
              TextButton(
                onPressed: () => onDialogCancelPressed(
                  context: context,
                ),
                child: Text(
                  l10n.cancel,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          );
        },
      );
      break;
    default:
      break;
  }
}
