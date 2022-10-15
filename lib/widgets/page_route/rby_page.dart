import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

/// Determines the transition of the [RbyPage].
enum PageRouteType { platform, slide, fade }

class RbyPage<T> extends Page<T> {
  const RbyPage({
    required this.builder,
    this.maintainState = true,
    this.fullscreenDialog = false,
    this.pageRouteType = PageRouteType.slide,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final WidgetBuilder builder;

  /// {@macro flutter.widgets.ModalRoute.maintainState}
  final bool maintainState;

  /// {@macro flutter.widgets.PageRoute.fullscreenDialog}
  final bool fullscreenDialog;

  /// Determines which page route is used.
  final PageRouteType pageRouteType;

  @override
  Route<T> createRoute(BuildContext context) {
    final theme = Theme.of(context);

    switch (pageRouteType) {
      case PageRouteType.platform:
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.iOS:
            continue slide;
          case TargetPlatform.linux:
          case TargetPlatform.macOS:
          case TargetPlatform.windows:
            continue fade;
        }
      slide:
      case PageRouteType.slide:
        return SlidePageRoute(
          settings: this,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          builder: builder,
        );
      fade:
      case PageRouteType.fade:
        return FadePageRoute(
          settings: this,
          duration: theme.animation.short,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          builder: builder,
        );
    }
  }
}
