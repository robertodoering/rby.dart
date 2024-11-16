import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class RbyTheme {
  RbyTheme({
    required ColorScheme colorScheme,
    RbyShapeTheme? shape,
    RbySpacingTheme? spacing,
    RbyAnimationTheme? animation,
    RbyIconDataTheme? iconData,
  }) {
    spacing = spacing ?? const RbySpacingTheme(base: 16);
    shape = shape ?? RbyShapeTheme(radius: const Radius.circular(16));
    animation = animation ??
        const RbyAnimationTheme(
          short: Duration(milliseconds: 250),
          long: Duration(milliseconds: 500),
        );
    iconData = iconData ??
        RbyIconDataTheme(
          drawer: (_) => const RotatedBox(
            quarterTurns: 1,
            child: Icon(CupertinoIcons.chart_bar_alt_fill),
          ),
          close: (_) => const Icon(CupertinoIcons.xmark),
          back: (_) => Transform.translate(
            offset: const Offset(-1, 0),
            child: const Icon(CupertinoIcons.left_chevron),
          ),
          expand: (_) => const Icon(CupertinoIcons.chevron_down),
        );

    final textTheme = colorScheme.brightness == Brightness.light
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    data = ThemeData.from(colorScheme: colorScheme).copyWith(
      textTheme: textTheme,

      // prevent platform depended padding values in material widgets
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,

      //
      splashColor: colorScheme.secondary.withOpacity(.1),
      highlightColor: colorScheme.secondary.withOpacity(.1),

      //
      iconTheme: IconThemeData(
        color: colorScheme.onSurface,
        size: 20,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.onSurface.withOpacity(.2),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: shape.shape,
        color: colorScheme.surfaceContainerHighest,
        margin: EdgeInsets.zero,
      ),
      dialogTheme: DialogTheme(shape: shape.shape),
      snackBarTheme: SnackBarThemeData(
        elevation: 0,
        shape: shape.shape,
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.surfaceContainerHighest,
        actionTextColor: colorScheme.primary,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colorScheme.primary
              : null,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (state) => state.contains(WidgetState.selected)
              ? colorScheme.primary
              : null,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colorScheme.primary.withAlpha(0x80)
              : null,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: shape.shape,
        enableFeedback: true,
        elevation: 0,
        color: colorScheme.surfaceContainerHighest,
        textStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(spacing.base),
        border: OutlineInputBorder(
          borderRadius: shape.borderRadius,
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(.4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: shape.borderRadius,
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(.4),
          ),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        thumbColor: colorScheme.primary,
        valueIndicatorColor: colorScheme.primary.withOpacity(.8),
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: textTheme.titleMedium?.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
      tooltipTheme: TooltipThemeData(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.base,
          vertical: spacing.small,
        ),
        textStyle: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary),
        preferBelow: false,
        decoration: BoxDecoration(
          borderRadius: shape.borderRadius,
          color: colorScheme.primary.withOpacity(.8),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(radius: shape.radius),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        color: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),

      // buttons
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: spacing.base,
              vertical: spacing.small,
            ),
          ),
          minimumSize: WidgetStateProperty.all(Size.zero),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: shape.borderRadius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: spacing.base,
              vertical: spacing.small,
            ),
          ),
          minimumSize: WidgetStateProperty.all(Size.zero),
          side: WidgetStateProperty.all(
            BorderSide(color: colorScheme.primary.withOpacity(.8)),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: shape.borderRadius,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: spacing.base,
              vertical: spacing.small,
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(Size.zero),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: shape.borderRadius),
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? colorScheme.primary.withOpacity(.12)
                : colorScheme.primary,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? colorScheme.onSurface.withOpacity(.38)
                : colorScheme.onPrimary,
          ),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.onPrimary.withOpacity(0.08);
            } else if (states.contains(WidgetState.focused) ||
                states.contains(WidgetState.pressed)) {
              return colorScheme.onPrimary.withOpacity(0.24);
            } else {
              return null;
            }
          }),
        ),
      ),

      //
      extensions: [
        spacing,
        shape,
        animation,
        iconData,
      ],
    );
  }

  late final ThemeData data;
}
