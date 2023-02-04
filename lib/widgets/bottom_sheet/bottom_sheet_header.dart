import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: theme.spacing.edgeInsets,
      child: DefaultTextStyle(
        style: theme.textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
        child: child,
      ),
    );
  }
}
