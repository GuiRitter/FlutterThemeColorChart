import 'package:flutter/material.dart';
import 'package:theme_color_chart/utils/data.dart';
import 'package:theme_color_chart/utils/logger.dart';

final _keyMap = <String, GlobalKey>{};

final _log = logger("DropDownMenuWidget");

final _widthMap = <String, double>{};

/// TODO remove after `expandedInsets` is merged into `stable`.
class DropDownMenuWidget<T> extends StatelessWidget {
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final Widget? label;
  final bool? requestFocusOnTap;
  final String name;

  const DropDownMenuWidget({
    super.key,
    required this.name,
    required this.dropdownMenuEntries,
    required this.label,
    required this.requestFocusOnTap,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final placeHolderKey = getFromMapConstructIfNull(
      key: name,
      map: _keyMap,
      constructor: () => GlobalKey(),
    );

    final theme = Theme.of(context);

    return FutureBuilder(
      future: getDropDownMenuWidth(
        delay: 0,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownMenu(
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
            key: placeHolderKey,
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

    var width = _widthMap[name];

    if (width != null) {
      return width;
    }

    await Future.delayed(
      Duration(
        microseconds: delay,
      ),
    );

    final key = _keyMap[name] as GlobalKey;

    final BuildContext? placeHolderContext = key.currentContext;

    if ((placeHolderContext != null) && (placeHolderContext.mounted)) {
      final renderBox = placeHolderContext.findRenderObject() as RenderBox;

      width = renderBox.size.width;

      _widthMap[name] = width;

      return width;
    } else {
      return await getDropDownMenuWidth(
        delay: delay + 1,
      );
    }
  }
}
