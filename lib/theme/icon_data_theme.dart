import 'package:flutter/material.dart';

class RbyIconDataTheme extends ThemeExtension<RbyIconDataTheme> {
  RbyIconDataTheme({
    required this.drawer,
    required this.close,
    required this.back,
    required this.expand,
  });

  final WidgetBuilder drawer;
  final WidgetBuilder close;
  final WidgetBuilder back;
  final WidgetBuilder expand;

  @override
  ThemeExtension<RbyIconDataTheme> copyWith({
    WidgetBuilder? drawer,
    WidgetBuilder? close,
    WidgetBuilder? back,
    WidgetBuilder? expand,
  }) {
    return RbyIconDataTheme(
      drawer: drawer ?? this.close,
      close: close ?? this.close,
      back: back ?? this.back,
      expand: expand ?? this.expand,
    );
  }

  @override
  ThemeExtension<RbyIconDataTheme> lerp(
    ThemeExtension<RbyIconDataTheme>? other,
    double t,
  ) {
    return other ?? this;
  }
}

extension RbyIconDataThemeExtension on ThemeData {
  RbyIconDataTheme get iconData => extension<RbyIconDataTheme>()!;
}
