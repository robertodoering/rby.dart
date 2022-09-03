import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final texts = [
      Text('displayLarge', style: textTheme.displayLarge),
      Text('displayMedium', style: textTheme.displayMedium),
      Text('displaySmall', style: textTheme.displaySmall),
      Text('headlineLarge', style: textTheme.headlineLarge),
      Text('headlineMedium', style: textTheme.headlineMedium),
      Text('headlineSmall', style: textTheme.headlineSmall),
      Text('titleLarge', style: textTheme.titleLarge),
      Text('titleMedium', style: textTheme.titleMedium),
      Text('titleSmall', style: textTheme.titleSmall),
      Text('bodyLarge', style: textTheme.bodyLarge),
      Text('bodyMedium', style: textTheme.bodyMedium),
      Text('bodySmall', style: textTheme.bodySmall),
      Text('labelLarge', style: textTheme.labelLarge),
      Text('labelMedium', style: textTheme.labelMedium),
      Text('labelSmall', style: textTheme.labelSmall),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('typography')),
      body: DefaultTextStyle(
        style: textTheme.bodyMedium!,
        maxLines: 1,
        child: ListView(
          padding: theme.edgeInsets,
          children: [
            for (final text in texts)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.outline.withOpacity(.5),
                  ),
                ),
                margin: EdgeInsets.only(bottom: theme.smallPaddingValue),
                child: text,
              ),
          ],
        ),
      ),
    );
  }
}
