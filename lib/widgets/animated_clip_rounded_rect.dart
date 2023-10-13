import 'package:flutter/widgets.dart';

class AnimatedClipRRect extends ImplicitlyAnimatedWidget {
  const AnimatedClipRRect({
    super.key,
    required super.duration,
    super.curve,
    required this.borderRadius,
    required this.child,
  });

  final BorderRadius borderRadius;
  final Widget child;

  @override
  AnimatedWidgetBaseState<AnimatedClipRRect> createState() =>
      _AnimatedClipRRectState();
}

class _AnimatedClipRRectState
    extends AnimatedWidgetBaseState<AnimatedClipRRect> {
  BorderRadiusTween? _borderRadius;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _borderRadius = visitor(
      _borderRadius,
      widget.borderRadius,
      (value) => BorderRadiusTween(begin: value as BorderRadius?),
    ) as BorderRadiusTween?;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius!.evaluate(animation)!,
      child: widget.child,
    );
  }
}
