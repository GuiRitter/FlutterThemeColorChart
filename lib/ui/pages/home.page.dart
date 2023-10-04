import 'package:flutter/material.dart';
import 'package:theme_color_chart/ui/widgets/app_bar.widget.dart' as app_bar;

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: app_bar.build(),
      body: const Placeholder(),
    );
  }
}
