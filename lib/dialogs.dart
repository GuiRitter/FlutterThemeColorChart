import 'package:flutter/material.dart';
import 'package:theme_color_chart/utils/logger.dart';

final _log = logger("utils/dialogs");

onDialogCancelPressed({
  required BuildContext context,
}) {
  _log("onDialogCancelPressed").print();

  Navigator.pop(
    context,
  );
}
