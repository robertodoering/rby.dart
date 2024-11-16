import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

abstract class RbyButton extends StatelessWidget {
  const RbyButton();

  /// A [TextButton] based on the [ThemeData.textButtonTheme].
  const factory RbyButton.text({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
  }) = _RbyTextButton;

  /// An [ElevatedButton] based on the [ThemeData.elevatedButtonTheme].
  const factory RbyButton.elevated({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
  }) = _RbyElevatedButton;

  /// An [ElevatedButton] based on the [ThemeData.outlinedButtonTheme].
  const factory RbyButton.outlined({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
  }) = _RbyOutlinedButton;

  /// A flat transparent button with even vertical and horizontal padding.
  const factory RbyButton.transparent({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
  }) = _RbyTransparentButton;

  /// A flat button that matches the style of a [Card] with even vertical and
  /// horizontal padding.
  const factory RbyButton.card({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
    Color? foregroundColor,
    Color? backgroundColor,
  }) = _RbyCardButton;
}

class _RbyTextButton extends RbyButton {
  const _RbyTextButton({
    required this.onTap,
    this.icon,
    this.label,
    this.onLongPress,
    this.padding,
  });

  final Widget? icon;
  final Widget? label;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      style: theme.textButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.all(padding),
      ),
      onPressed: onTap,
      onLongPress: onLongPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
        ],
      ),
    );
  }
}

class _RbyElevatedButton extends RbyButton {
  const _RbyElevatedButton({
    required this.onTap,
    this.icon,
    this.label,
    this.onLongPress,
    this.padding,
  });

  final Widget? icon;
  final Widget? label;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: theme.textButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.all(padding),
      ),
      onPressed: onTap,
      onLongPress: onLongPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
        ],
      ),
    );
  }
}

class _RbyOutlinedButton extends RbyButton {
  const _RbyOutlinedButton({
    required this.onTap,
    this.icon,
    this.label,
    this.onLongPress,
    this.padding,
  });

  final Widget? icon;
  final Widget? label;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      style: theme.textButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.all(padding),
      ),
      onPressed: onTap,
      onLongPress: onLongPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
        ],
      ),
    );
  }
}

class _RbyTransparentButton extends RbyButton {
  const _RbyTransparentButton({
    required this.onTap,
    this.icon,
    this.label,
    this.onLongPress,
    this.padding,
  });

  final Widget? icon;
  final Widget? label;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? theme.colorScheme.onSurface.withOpacity(.5)
            : theme.colorScheme.onSurface,
      ),
      overlayColor: WidgetStateProperty.all(theme.highlightColor),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(
        padding ?? theme.spacing.edgeInsets,
      ),
    );

    return TextButton(
      onPressed: onTap,
      onLongPress: onLongPress,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
        ],
      ),
    );
  }
}

class _RbyCardButton extends RbyButton {
  const _RbyCardButton({
    required this.onTap,
    this.icon,
    this.label,
    this.onLongPress,
    this.padding,
    this.foregroundColor,
    this.backgroundColor,
  });

  final Widget? icon;
  final Widget? label;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = backgroundColor ?? theme.cardTheme.color!;
    final foreground = foregroundColor ?? theme.colorScheme.onSurface;

    final style = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? background.withOpacity(0)
            : background,
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? foreground.withOpacity(.5)
            : foreground,
      ),
      overlayColor: WidgetStateProperty.all(theme.highlightColor),
      elevation: WidgetStateProperty.all(theme.cardTheme.elevation),
      padding: WidgetStateProperty.all(
        padding ?? theme.spacing.edgeInsets,
      ),
    );

    return ElevatedButton(
      onPressed: onTap,
      onLongPress: onLongPress,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
        ],
      ),
    );
  }
}
