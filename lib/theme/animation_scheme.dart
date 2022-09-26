import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RbyAnimationScheme extends ThemeExtension<RbyAnimationScheme> {
  const RbyAnimationScheme({
    required this.short,
    required this.long,
  });

  final Duration short;
  final Duration long;

  @override
  ThemeExtension<RbyAnimationScheme> copyWith({
    Duration? short,
    Duration? long,
  }) {
    return RbyAnimationScheme(
      short: short ?? this.short,
      long: long ?? this.long,
    );
  }

  @override
  ThemeExtension<RbyAnimationScheme> lerp(
    ThemeExtension<RbyAnimationScheme>? other,
    double t,
  ) {
    if (other is! RbyAnimationScheme) return this;

    return RbyAnimationScheme(
      short: lerpDuration(
        short,
        other.short,
        t,
      ),
      long: lerpDuration(
        long,
        other.long,
        t,
      ),
    );
  }
}

extension RbyAnimationSchemeExtension on ThemeData {
  RbyAnimationScheme get animationScheme => extension<RbyAnimationScheme>()!;
}
