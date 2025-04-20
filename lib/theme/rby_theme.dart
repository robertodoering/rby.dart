import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

@immutable
class RbyTheme {
  RbyTheme({
    required ColorScheme colorScheme,
    TextTheme? textTheme,
    this.spacingScheme = const SpacingScheme.fallback(),
    this.radiusScheme = const RadiusScheme.fallback(),
    List<ThemeExtension> extensions = const [],
  }) {
    final themeData = ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
      useMaterial3: true,
    );

    textTheme ??= themeData.textTheme;

    data = themeData.copyWith(
      splashFactory: NoSplash.splashFactory,
      dividerTheme: const DividerThemeData(thickness: 1, space: 1),
      cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(radiusScheme.large),
        ),
      ),
      inputDecorationTheme: themeData.inputDecorationTheme.copyWith(
        contentPadding: EdgeInsets.symmetric(
          vertical: spacingScheme.m,
          horizontal: spacingScheme.l,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radiusScheme.large),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radiusScheme.large),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radiusScheme.large),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radiusScheme.large),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withValues(alpha: .12),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radiusScheme.large),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.standard,
          padding: EdgeInsets.symmetric(
            vertical: spacingScheme.m,
            horizontal: spacingScheme.l,
          ),
          shape: const StadiumBorder(),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.standard,
          padding: EdgeInsets.symmetric(
            vertical: spacingScheme.m,
            horizontal: spacingScheme.l,
          ),
          shape: const StadiumBorder(),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.standard,
          padding: EdgeInsets.symmetric(
            vertical: spacingScheme.m,
            horizontal: spacingScheme.l,
          ),
          shape: const StadiumBorder(),
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(radiusScheme.large),
        ),
      ),
      extensions: [
        spacingScheme,
        radiusScheme,
        ...extensions,
      ],
    );
  }

  final SpacingScheme spacingScheme;
  final RadiusScheme radiusScheme;

  late final ThemeData data;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RbyTheme &&
        other.spacingScheme == spacingScheme &&
        other.radiusScheme == radiusScheme &&
        other.data == data;
  }

  @override
  int get hashCode => Object.hash(spacingScheme, radiusScheme, data);
}
