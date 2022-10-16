import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RbyAnimationTheme extends ThemeExtension<RbyAnimationTheme> {
  const RbyAnimationTheme({
    required this.short,
    required this.long,
  });

  final Duration short;
  final Duration long;

  @override
  ThemeExtension<RbyAnimationTheme> copyWith({
    Duration? short,
    Duration? long,
  }) {
    return RbyAnimationTheme(
      short: short ?? this.short,
      long: long ?? this.long,
    );
  }

  @override
  ThemeExtension<RbyAnimationTheme> lerp(
    ThemeExtension<RbyAnimationTheme>? other,
    double t,
  ) {
    if (other is! RbyAnimationTheme) return this;

    return RbyAnimationTheme(
      short: lerpDuration(short, other.short, t),
      long: lerpDuration(long, other.long, t),
    );
  }
}

extension RbyAnimationThemeExtension on ThemeData {
  RbyAnimationTheme get animation => extension<RbyAnimationTheme>()!;
}
