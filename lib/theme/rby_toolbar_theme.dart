import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

extension RbyToolbarThemeExtension on ThemeData {
  RbyToolbarTheme get toolbarTheme => extension<RbyToolbarTheme>()!;
}

@immutable
class RbyToolbarTheme extends ThemeExtension<RbyToolbarTheme> {
  const RbyToolbarTheme({
    required this.height,
    required this.padding,
    required this.middleSpacing,
    required this.buttonStyle,
    required this.automaticallyImplyLeading,
    required this.backIcon,
    required this.closeIcon,
    required this.openDrawerIcon,
    required this.decoration,
    required this.sliverDecoration,
    required this.sliverOverscrollDecoration,
    required this.sliverBackdropFilter,
  });

  RbyToolbarTheme.fallback(ColorScheme colorScheme, SpacingScheme spacingScheme)
      : height = defaultTargetPlatform.isDesktop ? 40 : 56,
        padding = EdgeInsets.symmetric(horizontal: spacingScheme.m),
        middleSpacing = spacingScheme.m,
        buttonStyle = TextButton.styleFrom(
          padding: EdgeInsets.all(spacingScheme.m),
          foregroundColor: colorScheme.onBackground,
        ),
        automaticallyImplyLeading = true,
        backIcon = Icons.arrow_back_rounded,
        closeIcon = Icons.close_rounded,
        openDrawerIcon = Icons.menu_rounded,
        decoration = null,
        sliverDecoration = BoxDecoration(
          color: colorScheme.background.withOpacity(.9),
          border: Border(
            bottom: BorderSide(
              color: colorScheme.outlineVariant.withOpacity(0),
            ),
          ),
        ),
        sliverOverscrollDecoration = BoxDecoration(
          color: colorScheme.background.withOpacity(.9),
          border: Border(
            bottom: BorderSide(
              color: colorScheme.outlineVariant,
            ),
          ),
        ),
        sliverBackdropFilter = ImageFilter.blur(sigmaX: 36, sigmaY: 36);

  final double height;
  final EdgeInsets padding;
  final double middleSpacing;
  final ButtonStyle? buttonStyle;

  /// Whether the toolbar should automatically try to deduce what the leading
  /// widget should be when none has been provided.
  final bool automaticallyImplyLeading;

  /// Icons to use for the automatically implied leading widget.
  final IconData? backIcon;
  final IconData? closeIcon;
  final IconData? openDrawerIcon;

  /// The decoration to paint behind the [RbyToolbar].
  final BoxDecoration? decoration;

  /// The decoration to paint behind the [RbySliverToolbar].
  final BoxDecoration? sliverDecoration;

  /// The decoration to paint behind the [RbySliverToolbar] when content is
  /// visually behind the toolbar.
  ///
  /// Defaults to [sliverDecoration] when `null`.
  final BoxDecoration? sliverOverscrollDecoration;

  /// Built behind the [RbySliverToolbar].
  ///
  /// Can be used to blur the content behind the toolbar.
  final ImageFilter? sliverBackdropFilter;

  @override
  RbyToolbarTheme copyWith({
    double? height,
    EdgeInsets? padding,
    double? middleSpacing,
    ButtonStyle? buttonStyle,
    bool? automaticallyImplyLeading,
    IconData? backIcon,
    IconData? closeIcon,
    IconData? openDrawerIcon,
    BoxDecoration? decoration,
    BoxDecoration? sliverDecoration,
    BoxDecoration? sliverOverscrollDecoration,
    ImageFilter? sliverBackdropFilter,
  }) {
    return RbyToolbarTheme(
      height: height ?? this.height,
      padding: padding ?? this.padding,
      middleSpacing: middleSpacing ?? this.middleSpacing,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      automaticallyImplyLeading:
          automaticallyImplyLeading ?? this.automaticallyImplyLeading,
      backIcon: backIcon ?? this.backIcon,
      closeIcon: closeIcon ?? this.closeIcon,
      openDrawerIcon: openDrawerIcon ?? this.openDrawerIcon,
      decoration: decoration ?? this.decoration,
      sliverDecoration: sliverDecoration ?? this.sliverDecoration,
      sliverOverscrollDecoration:
          sliverOverscrollDecoration ?? this.sliverOverscrollDecoration,
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
      padding: EdgeInsets.lerp(padding, other?.padding ?? padding, t)!,
      middleSpacing: lerpDouble(
        middleSpacing,
        other?.middleSpacing ?? middleSpacing,
        t,
      )!,
      buttonStyle: ButtonStyle.lerp(buttonStyle, other?.buttonStyle, t),
      automaticallyImplyLeading:
          other?.automaticallyImplyLeading ?? automaticallyImplyLeading,
      backIcon: other?.backIcon,
      closeIcon: other?.closeIcon,
      openDrawerIcon: other?.openDrawerIcon,

      // NOTE: The toolbar will lerp the decorations manually.
      decoration: other?.decoration,
      sliverDecoration: other?.sliverDecoration,
      sliverOverscrollDecoration: other?.sliverOverscrollDecoration,

      sliverBackdropFilter: other?.sliverBackdropFilter,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RbyToolbarTheme &&
        other.height == height &&
        other.padding == padding &&
        other.middleSpacing == middleSpacing &&
        other.buttonStyle == buttonStyle &&
        other.automaticallyImplyLeading == automaticallyImplyLeading &&
        other.backIcon == backIcon &&
        other.closeIcon == closeIcon &&
        other.openDrawerIcon == openDrawerIcon &&
        other.decoration == decoration &&
        other.sliverDecoration == sliverDecoration &&
        other.sliverOverscrollDecoration == sliverOverscrollDecoration &&
        other.sliverBackdropFilter == sliverBackdropFilter;
  }

  @override
  int get hashCode {
    return height.hashCode ^
        padding.hashCode ^
        middleSpacing.hashCode ^
        buttonStyle.hashCode ^
        automaticallyImplyLeading.hashCode ^
        backIcon.hashCode ^
        closeIcon.hashCode ^
        openDrawerIcon.hashCode ^
        decoration.hashCode ^
        sliverDecoration.hashCode ^
        sliverOverscrollDecoration.hashCode ^
        sliverBackdropFilter.hashCode;
  }
}
