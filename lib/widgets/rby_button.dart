import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

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
        padding: MaterialStateProperty.all(padding),
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
        padding: MaterialStateProperty.all(padding),
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
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.disabled)
            ? theme.colorScheme.onBackground.withOpacity(.5)
            : theme.colorScheme.onBackground,
      ),
      overlayColor: MaterialStateProperty.all(theme.highlightColor),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(padding ?? theme.edgeInsets),
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
    final foreground = foregroundColor ?? theme.colorScheme.onBackground;

    final style = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.disabled)
            ? background.withOpacity(0)
            : background,
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.disabled)
            ? foreground.withOpacity(.5)
            : foreground,
      ),
      overlayColor: MaterialStateProperty.all(theme.highlightColor),
      elevation: MaterialStateProperty.all(theme.cardTheme.elevation),
      padding: MaterialStateProperty.all(padding ?? theme.edgeInsets),
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
