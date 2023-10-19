import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme_color_chart/constants/app_bar_popup_menu.enum.dart';
import 'package:theme_color_chart/constants/color_scheme.enum.dart';
import 'package:theme_color_chart/constants/settings.dart';
import 'package:theme_color_chart/constants/theme.enum.dart';
import 'package:theme_color_chart/constants/theme_data.enum.dart';
import 'package:theme_color_chart/dialogs.dart';
import 'package:theme_color_chart/main.dart';
import 'package:theme_color_chart/ui/widgets/theme_option.widget.dart';
import 'package:theme_color_chart/utils/logger.dart';

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

const shadows = <Shadow>[
  shadow,
  shadow,
  shadow,
  shadow,
  shadow,
  shadow,
  shadow,
  shadow,
];

final GlobalKey _appBarKey = GlobalKey();

final _log = logger("AppBarWidget");

double? _elevation;

AppBar build({
  required BuildContext context,
}) {
  final l10n = AppLocalizations.of(
    navigatorState.currentContext!,
  )!;

  return AppBar(
    key: _appBarKey,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.title,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(
                color: Color.lerp(
                  Theme.of(
                    context,
                  ).textTheme.bodySmall!.color,
                  Theme.of(
                    context,
                  ).appBarTheme.foregroundColor,
                  0.5,
                ),
              ),
        ),
        const Text(
          "Subtitle",
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          darkModeNotifier.value = !darkModeNotifier.value;
        },
        child: ValueListenableBuilder(
          valueListenable: darkModeNotifier,
          builder: (_, value, __) => Stack(
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  shadows: shadows,
                ),
              ),
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          var index = ThemeDataEnum.values.indexOf(
                themeDataNotifier.value,
              ) -
              1;

          if (index < 0) {
            index = ThemeDataEnum.values.length - 1;
          }

          themeDataNotifier.value = ThemeDataEnum.values[index];
        },
        icon: const Icon(
          Icons.chevron_left,
        ),
      ),
      TextButton(
        onPressed: () {},
        child: ValueListenableBuilder(
          valueListenable: themeDataNotifier,
          builder: (_, value, __) => Stack(
            children: [
              Text(
                value.name,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: shadows,
                ),
              ),
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          var index = ThemeDataEnum.values.indexOf(
                themeDataNotifier.value,
              ) +
              1;

          if (index > (ThemeDataEnum.values.length - 1)) {
            index = 0;
          }

          themeDataNotifier.value = ThemeDataEnum.values[index];
        },
        icon: const Icon(
          Icons.chevron_right,
        ),
      ),
      IconButton(
        onPressed: () {
          var index = ColorSchemeEnum.values.indexOf(
                colorSchemeNotifier.value,
              ) -
              1;

          if (index < 0) {
            index = ColorSchemeEnum.values.length - 1;
          }

          colorSchemeNotifier.value = ColorSchemeEnum.values[index];
        },
        icon: const Icon(
          Icons.chevron_left,
        ),
      ),
      TextButton(
        onPressed: () {},
        child: ValueListenableBuilder(
          valueListenable: colorSchemeNotifier,
          builder: (_, value, __) => Stack(
            children: [
              Text(
                value.name,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: shadows,
                ),
              ),
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          var index = ColorSchemeEnum.values.indexOf(
                colorSchemeNotifier.value,
              ) +
              1;

          if (index > (ColorSchemeEnum.values.length - 1)) {
            index = 0;
          }

          colorSchemeNotifier.value = ColorSchemeEnum.values[index];
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

  if (_elevation != null) {
    return _elevation!;
  }

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

    _elevation = material.elevation;

    return _elevation!;
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
        barrierColor: Theme.of(
          navigatorState.currentContext!,
        ).colorScheme.scrim,
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
