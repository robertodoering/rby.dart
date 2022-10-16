import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class RbyAnimatedSize extends StatelessWidget {
  const RbyAnimatedSize({
    super.key,
    required this.child,
    this.curve = Curves.easeOutCubic,
    this.alignment = Alignment.center,
  });

  final Widget child;
  final Curve curve;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedSize(
      duration: theme.animation.short,
      alignment: alignment,
      curve: curve,
      child: child,
    );
  }
}
