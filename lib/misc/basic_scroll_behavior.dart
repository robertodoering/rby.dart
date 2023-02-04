import 'package:flutter/widgets.dart';

/// [ScrollBehavior] implementation that uses the [ClampingScrollPhysics] but
/// never builds a [GlowingOverscrollIndicator] to prevent the android
/// glow or stretch overscroll effect.
class BasicScrollBehavior extends ScrollBehavior {
  const BasicScrollBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics(
      parent: RangeMaintainingScrollPhysics(),
    );
  }
}
