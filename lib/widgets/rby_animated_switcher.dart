import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

/// Builds an [AnimatedSwitcher] with some predefined defaults.
class RbyAnimatedSwitcher extends StatelessWidget {
  const RbyAnimatedSwitcher({
    required this.child,
    this.duration,
    this.reverseDuration,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  });

  // TODO: add sliver tools dependency
  // const RbyAnimatedSwitcher.sliver({
  //   required this.child,
  //   this.duration,
  //   this.reverseDuration,
  // })  : transitionBuilder = SliverAnimatedSwitcher.defaultTransitionBuilder,
  //       layoutBuilder = SliverAnimatedSwitcher.defaultLayoutBuilder;

  final Widget child;

  /// Defaults to [RbyAnimationScheme.short].
  final Duration? duration;

  final Duration? reverseDuration;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  @override
  Widget build(BuildContext context) {
    final duration = this.duration ?? Theme.of(context).animationScheme.short;

    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
      child: child,
    );
  }
}
