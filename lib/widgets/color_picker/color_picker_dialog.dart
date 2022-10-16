import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class ColorPickerDialog extends StatefulWidget {
  const ColorPickerDialog({
    required this.color,
    this.enableAlpha = false,
    this.onColorChanged,
  });

  final Color color;
  final bool enableAlpha;
  final ValueChanged<Color>? onColorChanged;

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  late Color _color = widget.color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return RbyDialog(
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      content: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (_, constraints) => ColorPicker(
            initialColor: widget.color,
            contentPadding: theme.spacing.base,
            enableAlpha: widget.enableAlpha,
            pickerAreaBorderRadius: theme.shape.borderRadius,
            colorPickerWidth: mediaQuery.orientation == Orientation.portrait
                ? constraints.maxWidth
                : 200,
            onColorChanged: (color) {
              _color = color;
              widget.onColorChanged?.call(color);
            },
          ),
        ),
      ),
      actions: [
        RbyButton.text(
          label: const Text('discard'),
          onTap: () => Navigator.of(context).pop(widget.color),
        ),
        RbyButton.elevated(
          label: const Text('select'),
          onTap: () => Navigator.of(context).pop(_color),
        ),
      ],
    );
  }
}
