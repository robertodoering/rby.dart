import 'package:flutter/material.dart';

class RbyShapeTheme extends ThemeExtension<RbyShapeTheme> {
  RbyShapeTheme({
    required this.radius,
    BorderRadius? borderRadius,
    ShapeBorder? shape,
  })  : borderRadius = borderRadius ?? BorderRadius.all(radius),
        shape = shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(radius),
            );

  final Radius radius;
  final BorderRadius borderRadius;
  final ShapeBorder shape;

  @override
  RbyShapeTheme copyWith({
    Radius? radius,
    BorderRadius? borderRadius,
    ShapeBorder? shape,
  }) {
    return RbyShapeTheme(
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      shape: shape ?? this.shape,
    );
  }

  @override
  ThemeExtension<RbyShapeTheme> lerp(
    ThemeExtension<RbyShapeTheme>? other,
    double t,
  ) {
    if (other is! RbyShapeTheme) return this;

    return RbyShapeTheme(
      radius: Radius.lerp(radius, other.radius, t) ?? radius,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
      shape: ShapeBorder.lerp(shape, other.shape, t),
    );
  }
}

extension RbyShapeSchemeExtension on ThemeData {
  RbyShapeTheme get shape => extension<RbyShapeTheme>()!;
}
