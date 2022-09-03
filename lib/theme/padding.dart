import 'dart:ui';

import 'package:flutter/material.dart';

// TODO: remove this enum
enum RbyPaddingType { small, base, large }

// TODO: remove
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
}

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

extension RbyPaddingDataThemeDataExtension on ThemeData {
  EdgeInsetsDirectional get smallEdgeInsets =>
      EdgeInsetsDirectional.all(paddingValue);
  EdgeInsetsDirectional get edgeInsets =>
      EdgeInsetsDirectional.all(paddingValue);
  EdgeInsetsDirectional get largeEdgeInsets =>
      EdgeInsetsDirectional.all(paddingValue);

  double get smallPaddingValue => extension<RbyPaddingData>()!.small;
  double get paddingValue => extension<RbyPaddingData>()!.base;
  double get largePaddingValue => extension<RbyPaddingData>()!.large;

  EdgeInsetsDirectional edgeInsetsOnly({
    bool start = false,
    bool end = false,
    bool top = false,
    bool bottom = false,
  }) {
    return EdgeInsetsDirectional.only(
      start: start ? paddingValue : 0,
      end: end ? paddingValue : 0,
      top: top ? paddingValue : 0,
      bottom: bottom ? paddingValue : 0,
    );
  }

  EdgeInsetsDirectional edgeInsetsSymmetric({
    bool horizontal = false,
    bool vertical = false,
  }) {
    return EdgeInsetsDirectional.only(
      start: horizontal ? paddingValue : 0,
      end: horizontal ? paddingValue : 0,
      top: vertical ? paddingValue : 0,
      bottom: vertical ? paddingValue : 0,
    );
  }
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
