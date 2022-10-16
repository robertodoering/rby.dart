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

      //
      useMaterial3: true,

      // prevent platform depended padding values in material widgets
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,

      //
      splashColor: colorScheme.primary.withOpacity(.1),
      highlightColor: colorScheme.primary.withOpacity(.1),

      //
      cardTheme: CardTheme(
        elevation: 0,
        shape: shape.shape,
        color: colorScheme.surfaceVariant,
        margin: EdgeInsets.zero,
      ),
      dialogTheme: DialogTheme(shape: shape.shape),
      snackBarTheme: SnackBarThemeData(
        elevation: 0,
        shape: shape.shape,
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.surfaceVariant,
        actionTextColor: colorScheme.primary,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? colorScheme.primary
              : null,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith(
          (state) => state.contains(MaterialState.selected)
              ? colorScheme.primary
              : null,
        ),
        trackColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? colorScheme.primary.withAlpha(0x80)
              : null,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: shape.shape,
        enableFeedback: true,
        elevation: 0,
        color: colorScheme.surfaceVariant,
        textStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(spacing.base),
        border: OutlineInputBorder(borderRadius: shape.borderRadius),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        thumbColor: colorScheme.primary,
        valueIndicatorColor: colorScheme.primary.withOpacity(.8),
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: textTheme.subtitle1?.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
      tooltipTheme: TooltipThemeData(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.base,
          vertical: spacing.small,
        ),
        textStyle: textTheme.subtitle2?.copyWith(color: colorScheme.onPrimary),
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
        color: colorScheme.background,
        foregroundColor: colorScheme.onBackground,
      ),

      // buttons
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: spacing.base,
              vertical: spacing.small,
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: shape.borderRadius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: spacing.base,
              vertical: spacing.small,
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size.zero),
          side: MaterialStateProperty.all(
            BorderSide(color: colorScheme.primary.withOpacity(.8)),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: shape.borderRadius,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: spacing.base,
              vertical: spacing.small,
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all(Size.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: shape.borderRadius),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.disabled)
                ? colorScheme.primary.withOpacity(.12)
                : colorScheme.primary,
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.disabled)
                ? colorScheme.onBackground.withOpacity(.38)
                : colorScheme.onPrimary,
          ),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return colorScheme.onPrimary.withOpacity(0.08);
            } else if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
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
