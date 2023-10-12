// ignore: unused_import
import 'dart:developer' as developer;

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
    final theme = Theme.of(
      context,
    );

    final fieldPadding = theme.textTheme.labelLarge?.fontSize ?? 0.0;

    fieldSpacing() => SizedBox.square(
          dimension: fieldPadding,
        );

    return Scaffold(
      appBar: app_bar.build(
        context: context,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            Theme.of(
                  context,
                ).textTheme.titleLarge?.fontSize ??
                0,
          ),
          child: Column(
            children: [
              Text(
                "headlineLarge",
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge,
              ),
              Text(
                "bodyLarge",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge,
              ),
              Text(
                "headlineSmall",
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall,
              ),
              Text(
                "bodySmall",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall,
              ),
              Form(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "TextFormField",
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              fieldSpacing(),
              const Divider(),
              fieldSpacing(),
              Form(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "TextFormField",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              fieldSpacing(),
              const Divider(),
              fieldSpacing(),
              Card(
                child: ListTile(
                  title: const Text(
                    "Card",
                  ),
                  trailing: PopupMenuButton<int>(
                    itemBuilder: (
                      context,
                    ) =>
                        [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: ListTile(
                          leading: SizedBox.shrink(),
                          title: Text(
                            "Single",
                          ),
                        ),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: ListTile(
                          leading: SizedBox.shrink(),
                          title: Text(
                            "1.15",
                          ),
                        ),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: ListTile(
                          leading: SizedBox.shrink(),
                          title: Text(
                            "Double",
                          ),
                        ),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: ListTile(
                          leading: Icon(
                            Icons.check,
                          ),
                          title: Text(
                            "Custom: 1.2",
                          ),
                        ),
                      ),
                      const PopupMenuItem<int>(
                        enabled: false,
                        padding: EdgeInsets.zero,
                        value: 4,
                        child: Divider(),
                      ),
                      const PopupMenuItem<int>(
                        value: 5,
                        child: ListTile(
                          title: Text(
                            "Add space before paragraph",
                          ),
                          trailing: Icon(
                            Icons.arrow_right,
                          ),
                        ),
                      ),
                      const PopupMenuItem<int>(
                        value: 6,
                        child: ListTile(
                          title: Text(
                            "Add space after paragraph",
                          ),
                        ),
                      ),
                      const PopupMenuItem<int>(
                        enabled: false,
                        padding: EdgeInsets.zero,
                        value: 7,
                        child: Divider(),
                      ),
                      const PopupMenuItem<int>(
                        value: 8,
                        child: ListTile(
                          title: Text(
                            "Custom spacing...",
                          ),
                        ),
                      ),
                    ],
                    onSelected: (
                      value,
                    ) {},
                  ),
                ),
              ),
              fieldSpacing(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Fullwidth Button",
                  ),
                ),
              ),
              fieldSpacing(),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Intrinsic Width Button",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
