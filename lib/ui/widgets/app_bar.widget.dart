import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme_color_chart/constants/app_bar_popup_menu.enum.dart';
import 'package:theme_color_chart/constants/settings.dart';
import 'package:theme_color_chart/constants/theme.enum.dart';
import 'package:theme_color_chart/dialogs.dart';
import 'package:theme_color_chart/ui/widgets/theme_option.widget.dart';
import 'package:theme_color_chart/utils/logger.dart';

final GlobalKey _appBarKey = GlobalKey();

final _log = logger("AppBarWidget");

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
          ];

          optionList.add(
            ThemeOptionWidget(
              themeMode: ThemeEnum.testDark,
              title: l10n.testDarkTheme,
            ),
          );

          optionList.add(
            ThemeOptionWidget(
              themeMode: ThemeEnum.testLight,
              title: l10n.testLightTheme,
            ),
          );

          optionList.add(
            ThemeOptionWidget(
              themeMode: ThemeEnum.system,
              title: l10n.systemTheme,
            ),
          );

          optionList.add(
            const ThemeOptionWidget(
              themeMode: ThemeEnum.fromSwatch,
              title: "fromSwatch",
            ),
          );

          optionList.add(
            const ThemeOptionWidget(
              themeMode: ThemeEnum.fromSeedBlack,
              title: "fromSeedBlack",
            ),
          );

          optionList.add(
            const ThemeOptionWidget(
              themeMode: ThemeEnum.fromSeedWhite,
              title: "fromSeedWhite",
            ),
          );

          optionList.add(
            const ThemeOptionWidget(
              themeMode: ThemeEnum.defaultLight,
              title: "defaultLight",
            ),
          );

          optionList.add(
            const ThemeOptionWidget(
              themeMode: ThemeEnum.highContrastLight,
              title: "highContrastLight",
            ),
          );

          optionList.add(
            const ThemeOptionWidget(
              themeMode: ThemeEnum.highContrastDark,
              title: "highContrastDark",
            ),
          );

          optionList.add(
            const ThemeOptionWidget(
              themeMode: ThemeEnum.defaultDark,
              title: "defaultDark",
            ),
          );

          optionList.add(
            const ThemeOptionWidget(
              themeMode: ThemeEnum.fromSwatchDark,
              title: "fromSwatchDark",
            ),
          );

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
