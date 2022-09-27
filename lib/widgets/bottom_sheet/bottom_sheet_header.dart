import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: theme.spacingScheme.edgeInsets,
      child: DefaultTextStyle(
        style: theme.textTheme.subtitle1!.copyWith(
          color: theme.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
        child: child,
      ),
    );
  }
}
