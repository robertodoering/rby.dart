import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rby_widgets/rby_widgets.dart';

class RbyRadioTile<T> extends StatelessWidget {
  const RbyRadioTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.leadingPadding,
    this.trailingPadding,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;

  final Widget? title;
  final Widget? subtitle;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? leadingPadding;
  final EdgeInsetsGeometry? trailingPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconTheme = IconTheme.of(context);

    final radioPadding = theme.spacing.base - (40 - iconTheme.size!) / 2;

    return RbyListTile(
      leading: Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged == null
            ? null
            : (value) {
                if (value != null) {
                  HapticFeedback.lightImpact();
                  onChanged?.call(value);
                }
              },
      ),
      title: title,
      subtitle: subtitle,
      onTap: onChanged != null
          ? () {
              HapticFeedback.lightImpact();
              onChanged?.call(value);
            }
          : null,
      enabled: onChanged != null,
      multilineTitle: true,
      contentPadding: contentPadding,
      leadingPadding: leadingPadding ??
          EdgeInsets.all(radioPadding.clamp(0, theme.spacing.base)),
      trailingPadding: trailingPadding,
    );
  }
}
