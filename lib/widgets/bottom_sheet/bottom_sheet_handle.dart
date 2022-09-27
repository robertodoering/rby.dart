import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 50,
      height: 4,
      margin: EdgeInsets.symmetric(vertical: theme.spacingScheme.small),
      decoration: BoxDecoration(
        borderRadius: theme.shapeScheme.borderRadius,
        color: theme.colorScheme.onBackground.withOpacity(.2),
      ),
    );
  }
}
