import 'dart:ui';

import 'package:flutter/material.dart';

enum RbyPaddingType { small, base, large }

/// Contains padding values that are used throughout the library.
class RbyPaddingData extends ThemeExtension<RbyPaddingData> {
  const RbyPaddingData({
    required this.base,
    double? small,
    double? large,
  })  : small = small ?? base / 2,
        large = large ?? base * 2;

  final double small;
  final double base;
  final double large;

  @override
  RbyPaddingData copyWith({
    double? small,
    double? base,
    double? large,
  }) {
    return RbyPaddingData(
      small: small ?? this.small,
      base: base ?? this.base,
      large: large ?? this.large,
    );
  }

  @override
  ThemeExtension<RbyPaddingData> lerp(
    ThemeExtension<RbyPaddingData>? other,
    double t,
  ) {
    if (other is! RbyPaddingData) return this;

    return RbyPaddingData(
      small: lerpDouble(small, other.small, t),
      base: lerpDouble(base, other.base, t) ?? base,
      large: lerpDouble(large, other.large, t),
    );
  }
}

extension RbyPaddingDataExtension on RbyPaddingData {
  double valueFromType(RbyPaddingType type) {
    switch (type) {
      case RbyPaddingType.small:
        return small;
      case RbyPaddingType.base:
        return base;
      case RbyPaddingType.large:
        return large;
    }
  }

  EdgeInsetsDirectional get edgeInsets => EdgeInsetsDirectional.all(base);

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
}

extension RbyPaddingDataThemeDataExtension on ThemeData {
  EdgeInsetsDirectional get edgeInsets =>
      extension<RbyPaddingData>()!.edgeInsets;

  double get paddingValue => extension<RbyPaddingData>()!.base;
}

extension EdgeInsetsDirectionalExtension on EdgeInsetsDirectional {
  EdgeInsetsDirectional copyWith({
    double? start,
    double? end,
    double? top,
    double? bottom,
  }) {
    return EdgeInsetsDirectional.only(
      start: start ?? this.start,
      end: end ?? this.end,
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
    );
  }
}
