import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

extension PaletteExtension on ThemeData {
  Palette get palette => extension<Palette>()!;
}

@immutable
class Palette extends ThemeExtension<Palette> {
  Palette({
    required this.seed,
  }) : _core = CorePalette.of(seed.value);

  final Color seed;
  final CorePalette _core;

  TonalPalette get primary => _core.primary;
  TonalPalette get secondary => _core.secondary;
  TonalPalette get tertiary => _core.tertiary;
  TonalPalette get neutral => _core.neutral;
  TonalPalette get neutralVariant => _core.neutralVariant;
  TonalPalette get error => _core.error;

  @override
  Palette copyWith({
    Color? seed,
  }) {
    return Palette(
      seed: seed ?? this.seed,
    );
  }

  @override
  ThemeExtension<Palette> lerp(covariant Palette? other, double t) {
    return Palette(
      seed: Color.lerp(seed, other?.seed ?? seed, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Palette && other._core == _core;
  }

  @override
  int get hashCode => _core.hashCode;
}
