import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class RbyTheme {
  RbyTheme({
    required ColorScheme colorScheme,
    RbyShapeScheme? shapeScheme,
    RbySpacingScheme? spacingScheme,
    RbyAnimationScheme? animationScheme,
  }) {
    spacingScheme = spacingScheme ?? const RbySpacingScheme(base: 16);
    shapeScheme =
        shapeScheme ?? RbyShapeScheme(radius: const Radius.circular(16));
    animationScheme = animationScheme ??
        const RbyAnimationScheme(
          short: Duration(milliseconds: 250),
          long: Duration(milliseconds: 2500),
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
        shape: shapeScheme.shape,
        color: colorScheme.surfaceVariant,
        margin: EdgeInsets.zero,
      ),
      dialogTheme: DialogTheme(shape: shapeScheme.shape),
      snackBarTheme: SnackBarThemeData(
        elevation: 0,
        shape: shapeScheme.shape,
        behavior: SnackBarBehavior.floating,
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
        shape: shapeScheme.shape,
        enableFeedback: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(spacingScheme.base),
        border: OutlineInputBorder(borderRadius: shapeScheme.borderRadius),
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
          horizontal: spacingScheme.base,
          vertical: spacingScheme.small,
        ),
        textStyle: textTheme.subtitle2?.copyWith(color: colorScheme.onPrimary),
        preferBelow: false,
        decoration: BoxDecoration(
          borderRadius: shapeScheme.borderRadius,
          color: colorScheme.primary.withOpacity(.8),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(radius: shapeScheme.radius),
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
              horizontal: spacingScheme.base,
              vertical: spacingScheme.small,
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: shapeScheme.borderRadius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: spacingScheme.base,
              vertical: spacingScheme.small,
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size.zero),
          side: MaterialStateProperty.all(
            BorderSide(color: colorScheme.primary.withOpacity(.8)),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: shapeScheme.borderRadius,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: spacingScheme.base,
              vertical: spacingScheme.small,
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all(Size.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: shapeScheme.borderRadius),
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
        spacingScheme,
        shapeScheme,
        animationScheme,
      ],
    );
  }

  late final ThemeData data;
}
