import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

extension RbyToolbarThemeExtension on ThemeData {
  RbyToolbarTheme get rbyToolbarTheme =>
      extension<RbyToolbarTheme>() ?? RbyToolbarTheme.fallback(colorScheme);
}

@immutable
class RbyToolbarTheme extends ThemeExtension<RbyToolbarTheme> {
  const RbyToolbarTheme({
    required this.height,
    required this.implyLeading,
    required this.implyTrailing,
    required this.backIcon,
    required this.closeIcon,
    required this.openDrawerIcon,
    required this.openEndDrawerIcon,
    required this.sliverBackgroundColor,
    required this.sliverBackdropFilter,
  });

  RbyToolbarTheme.fallback(ColorScheme colorScheme)
      : height = defaultTargetPlatform.isDesktop ? 40 : 56,
        implyLeading = true,
        implyTrailing = true,
        backIcon = Icons.arrow_back_rounded,
        closeIcon = Icons.close_rounded,
        openDrawerIcon = Icons.menu_rounded,
        openEndDrawerIcon = Icons.menu_rounded,
        sliverBackgroundColor = colorScheme.background.withOpacity(.9),
        sliverBackdropFilter = ImageFilter.blur(sigmaX: 36, sigmaY: 36);

  final double height;
  final bool implyLeading;
  final bool implyTrailing;
  final IconData? backIcon;
  final IconData? closeIcon;
  final IconData? openDrawerIcon;
  final IconData? openEndDrawerIcon;

  final Color? sliverBackgroundColor;
  final ImageFilter? sliverBackdropFilter;

  @override
  RbyToolbarTheme copyWith({
    double? height,
    bool? implyLeading,
    bool? implyTrailing,
    IconData? backIcon,
    IconData? closeIcon,
    IconData? openDrawerIcon,
    IconData? openEndDrawerIcon,
    Color? sliverBackgroundColor,
    ImageFilter? sliverBackdropFilter,
  }) {
    return RbyToolbarTheme(
      height: height ?? this.height,
      implyLeading: implyLeading ?? this.implyLeading,
      implyTrailing: implyTrailing ?? this.implyTrailing,
      backIcon: backIcon ?? this.backIcon,
      closeIcon: closeIcon ?? this.closeIcon,
      openDrawerIcon: openDrawerIcon ?? this.openDrawerIcon,
      openEndDrawerIcon: openEndDrawerIcon ?? this.openEndDrawerIcon,
      sliverBackgroundColor:
          sliverBackgroundColor ?? this.sliverBackgroundColor,
      sliverBackdropFilter: sliverBackdropFilter ?? this.sliverBackdropFilter,
    );
  }

  @override
  ThemeExtension<RbyToolbarTheme> lerp(
    covariant RbyToolbarTheme? other,
    double t,
  ) {
    return RbyToolbarTheme(
      height: lerpDouble(height, other?.height ?? height, t)!,
      implyLeading: other?.implyLeading ?? implyLeading,
      implyTrailing: other?.implyTrailing ?? implyTrailing,
      backIcon: other?.backIcon,
      closeIcon: other?.closeIcon,
      openDrawerIcon: other?.openDrawerIcon,
      openEndDrawerIcon: other?.openEndDrawerIcon,
      sliverBackgroundColor: Color.lerp(
        sliverBackgroundColor,
        other?.sliverBackgroundColor,
        t,
      ),
      sliverBackdropFilter: other?.sliverBackdropFilter,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RbyToolbarTheme &&
        other.height == height &&
        other.implyLeading == implyLeading &&
        other.implyTrailing == implyTrailing &&
        other.backIcon == backIcon &&
        other.closeIcon == closeIcon &&
        other.openDrawerIcon == openDrawerIcon &&
        other.openEndDrawerIcon == openEndDrawerIcon &&
        other.sliverBackgroundColor == sliverBackgroundColor &&
        other.sliverBackdropFilter == sliverBackdropFilter;
  }

  @override
  int get hashCode {
    return height.hashCode ^
        implyLeading.hashCode ^
        implyTrailing.hashCode ^
        backIcon.hashCode ^
        closeIcon.hashCode ^
        openDrawerIcon.hashCode ^
        openEndDrawerIcon.hashCode ^
        sliverBackgroundColor.hashCode ^
        sliverBackdropFilter.hashCode;
  }
}
