import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class RebuildOnTap extends StatefulWidget {
  const RebuildOnTap({
    required this.child,
  });

  final Widget child;

  @override
  State<RebuildOnTap> createState() => _RebuildOnTapState();
}

class _RebuildOnTapState extends State<RebuildOnTap> {
  var _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      behavior: HitTestBehavior.translucent,
      onTap: () => setState(() => _key = UniqueKey()),
      child: widget.child,
    );
  }
}

PageRoute<T> platformPageRoute<T>(
  BuildContext context, {
  required WidgetBuilder builder,
}) {
  final theme = Theme.of(context);

  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.iOS:
      return SlidePageRoute<T>(builder: builder);
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
      return FadePageRoute<T>(
        builder: builder,
        duration: theme.animation.short,
      );
  }
}
