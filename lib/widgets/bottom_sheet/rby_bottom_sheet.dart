import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rby_widgets/rby_widgets.dart';

/// Shows a bottom sheet with the [children] in a scroll view.
Future<T?> showRbyBottomSheet<T>(
  BuildContext context, {
  required List<Widget> children,
}) async {
  HapticFeedback.lightImpact().ignore();

  final theme = Theme.of(context);

  // TODO: add modal bottom sheet dependancy

  return showMaterialModalBottomSheet<T>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: theme.shapeScheme.radius,
        topRight: theme.shapeScheme.radius,
      ),
    ),
    builder: (context) => SafeArea(
      top: false,
      child: SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetHandle(),
            ...children,
          ],
        ),
      ),
    ),
  );
}
