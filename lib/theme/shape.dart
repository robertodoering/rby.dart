import 'package:flutter/material.dart';

class RbyShapeData extends ThemeExtension<RbyShapeData> {
  RbyShapeData({
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
  RbyShapeData copyWith({
    Radius? radius,
    BorderRadius? borderRadius,
    ShapeBorder? shape,
  }) {
    return RbyShapeData(
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      shape: shape ?? this.shape,
    );
  }

  @override
  ThemeExtension<RbyShapeData> lerp(
    ThemeExtension<RbyShapeData>? other,
    double t,
  ) {
    if (other is! RbyShapeData) return this;

    return RbyShapeData(
      radius: Radius.lerp(radius, other.radius, t) ?? radius,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
      shape: ShapeBorder.lerp(shape, other.shape, t),
    );
  }
}

extension RbyShapeDataThemeDataExtension on ThemeData {
  BorderRadius get borderRadius => extension<RbyShapeData>()!.borderRadius;
}
