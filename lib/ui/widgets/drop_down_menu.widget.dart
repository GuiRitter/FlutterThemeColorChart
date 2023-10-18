import 'package:flutter/material.dart';
import 'package:theme_color_chart/utils/logger.dart';

final _log = logger("DropDownMenuWidget");

/// TODO remove after `expandedInsets` is merged into `stable`.
class DropDownMenuWidget<T> extends StatelessWidget {
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final Widget? label;
  final bool? requestFocusOnTap;

  final _placeHolderKey = GlobalKey();
  final _menuKey = GlobalKey();

  DropDownMenuWidget({
    super.key,
    required this.dropdownMenuEntries,
    required this.label,
    required this.requestFocusOnTap,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(context);

    return FutureBuilder(
      future: getDropDownMenuWidth(
        delay: 0,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownMenu(
            key: _menuKey,
            dropdownMenuEntries: dropdownMenuEntries
                .map(
                  (
                    dropdownMenuEntry,
                  ) =>
                      DropdownMenuEntry(
                    // Digging through the API, seems like there's no other way...
                    style: ButtonStyle(
                      foregroundColor:
                          theme.menuButtonTheme.style?.foregroundColor,
                    ),
                    value: dropdownMenuEntry.value,
                    label: dropdownMenuEntry.label,
                  ),
                )
                .toList(),
            label: label,
            requestFocusOnTap: requestFocusOnTap,
            width: snapshot.data,
          );
        } else {
          return SizedBox(
            key: _placeHolderKey,
            width: double.infinity,
            child: const CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<double> getDropDownMenuWidth({
    required int delay,
  }) async {
    _log("getDropDownMenuWidth").raw("delay", delay).print();

    final BuildContext? menuContext = _menuKey.currentContext;

    if ((menuContext != null) && (menuContext.mounted)) {
      final renderBox = menuContext.findRenderObject() as RenderBox;

      return renderBox.size.width;
    }

    await Future.delayed(
      Duration(
        microseconds: delay,
      ),
    );

    final BuildContext? placeHolderContext = _placeHolderKey.currentContext;

    if ((placeHolderContext != null) && (placeHolderContext.mounted)) {
      final renderBox = placeHolderContext.findRenderObject() as RenderBox;

      return renderBox.size.width;
    } else {
      return await getDropDownMenuWidth(
        delay: delay + 1,
      );
    }
  }
}
