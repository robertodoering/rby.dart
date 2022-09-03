import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RbyAnimationData extends ThemeExtension<RbyAnimationData> {
  const RbyAnimationData({
    required this.shortAnimationDuration,
    required this.longAnimationDuration,
  });

  final Duration shortAnimationDuration;
  final Duration longAnimationDuration;

  @override
  ThemeExtension<RbyAnimationData> copyWith({
    Duration? shortAnimationDuration,
    Duration? longAnimationDuration,
  }) {
    return RbyAnimationData(
      shortAnimationDuration:
          shortAnimationDuration ?? this.shortAnimationDuration,
      longAnimationDuration:
          longAnimationDuration ?? this.longAnimationDuration,
    );
  }

  @override
  ThemeExtension<RbyAnimationData> lerp(
    ThemeExtension<RbyAnimationData>? other,
    double t,
  ) {
    if (other is! RbyAnimationData) return this;

    return RbyAnimationData(
      shortAnimationDuration: lerpDuration(
        shortAnimationDuration,
        other.shortAnimationDuration,
        t,
      ),
      longAnimationDuration: lerpDuration(
        longAnimationDuration,
        other.longAnimationDuration,
        t,
      ),
    );
  }
}

extension RbyAnimationDataExtension on ThemeData {
  Duration get shortAnimationDuration =>
      extension<RbyAnimationData>()!.shortAnimationDuration;

  Duration get longAnimationDuration =>
      extension<RbyAnimationData>()!.longAnimationDuration;
}
