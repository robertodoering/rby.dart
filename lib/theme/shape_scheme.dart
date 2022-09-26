import 'package:flutter/material.dart';

class RbyShapeScheme extends ThemeExtension<RbyShapeScheme> {
  RbyShapeScheme({
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
  RbyShapeScheme copyWith({
    Radius? radius,
    BorderRadius? borderRadius,
    ShapeBorder? shape,
  }) {
    return RbyShapeScheme(
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      shape: shape ?? this.shape,
    );
  }

  @override
  ThemeExtension<RbyShapeScheme> lerp(
    ThemeExtension<RbyShapeScheme>? other,
    double t,
  ) {
    if (other is! RbyShapeScheme) return this;

    return RbyShapeScheme(
      radius: Radius.lerp(radius, other.radius, t) ?? radius,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
      shape: ShapeBorder.lerp(shape, other.shape, t),
    );
  }
}

extension RbyShapeSchemeExtension on ThemeData {
  RbyShapeScheme get shapeScheme => extension<RbyShapeScheme>()!;
}
