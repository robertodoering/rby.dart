import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 50,
      height: 4,
      margin: EdgeInsets.symmetric(vertical: theme.spacing.small),
      decoration: BoxDecoration(
        borderRadius: theme.shape.borderRadius,
        color: theme.colorScheme.onBackground.withOpacity(.2),
      ),
    );
  }
}
