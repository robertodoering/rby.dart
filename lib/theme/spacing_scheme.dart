import 'dart:ui';

import 'package:flutter/material.dart';

/// Contains spacing values that are used throughout the library.
class RbySpacingScheme extends ThemeExtension<RbySpacingScheme> {
  const RbySpacingScheme({
    required this.base,
    double? small,
    double? large,
  })  : small = small ?? base / 2,
        large = large ?? base * 2;

  final double small;
  final double base;
  final double large;

  EdgeInsetsDirectional get smallEdgeInsets => EdgeInsetsDirectional.all(small);
  EdgeInsetsDirectional get edgeInsets => EdgeInsetsDirectional.all(base);
  EdgeInsetsDirectional get largeEdgeInsets => EdgeInsetsDirectional.all(large);

  EdgeInsetsDirectional edgeInsetsOnly({
    bool start = false,
    bool end = false,
    bool top = false,
    bool bottom = false,
  }) {
    return EdgeInsetsDirectional.only(
      start: start ? base : 0,
      end: end ? base : 0,
      top: top ? base : 0,
      bottom: bottom ? base : 0,
    );
  }

  EdgeInsetsDirectional edgeInsetsSymmetric({
    bool horizontal = false,
    bool vertical = false,
  }) {
    return EdgeInsetsDirectional.only(
      start: horizontal ? base : 0,
      end: horizontal ? base : 0,
      top: vertical ? base : 0,
      bottom: vertical ? base : 0,
    );
  }

  @override
  RbySpacingScheme copyWith({
    double? small,
    double? base,
    double? large,
  }) {
    return RbySpacingScheme(
      small: small ?? this.small,
      base: base ?? this.base,
      large: large ?? this.large,
    );
  }

  @override
  ThemeExtension<RbySpacingScheme> lerp(
    ThemeExtension<RbySpacingScheme>? other,
    double t,
  ) {
    if (other is! RbySpacingScheme) return this;

    return RbySpacingScheme(
      small: lerpDouble(small, other.small, t),
      base: lerpDouble(base, other.base, t) ?? base,
      large: lerpDouble(large, other.large, t),
    );
  }
}

extension RbySpacingSchemeExtension on ThemeData {
  RbySpacingScheme get spacingScheme => extension<RbySpacingScheme>()!;
}
