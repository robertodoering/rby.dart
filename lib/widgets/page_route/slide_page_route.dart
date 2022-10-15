import 'package:flutter/cupertino.dart';

/// A page route that uses the [CupertinoPageTransition] and
/// [CupertinoFullscreenDialogTransition] to transition between pages.
///
/// Unlike the [CupertinoPageRoute], no back gesture detector is built at the
/// edge of the screen since it conflicts with the native android back gesture.
class SlidePageRoute<T> extends PageRoute<T> {
  SlidePageRoute({
    required this.builder,
    this.maintainState = true,
    super.settings,
    super.fullscreenDialog,
  });

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    return nextRoute is SlidePageRoute && !nextRoute.fullscreenDialog;
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return fullscreenDialog
        ? CupertinoFullscreenDialogTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            linearTransition: false,
            child: child,
          )
        : CupertinoPageTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            linearTransition: false,
            child: child,
          );
  }
}
