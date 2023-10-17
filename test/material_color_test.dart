import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'main',
    () async {
      Colors.red;

      expect(
        Colors.red.shade500.value,
        Colors.red.value,
      );
    },
  );
}
