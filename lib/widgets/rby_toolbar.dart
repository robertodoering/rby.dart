import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class RbyToolbar extends StatelessWidget {
  const RbyToolbar({
    super.key,
    this.title,
    this.leading,
    this.trailing = const [],
    this.trailingSeparator = const Gap.m(),
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget> trailing;
  final Widget trailingSeparator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final toolbarTheme = theme.toolbarTheme;

    return _InternalRbyToolbar(
      title: title,
      leading: leading,
      trailing: trailing,
      trailingSeparator: trailingSeparator,
      height: toolbarTheme.height,
      padding: toolbarTheme.padding,
      middleSpacing: toolbarTheme.middleSpacing,
      buttonStyle: toolbarTheme.buttonStyle,
      automaticallyImplyLeading: toolbarTheme.automaticallyImplyLeading,
      decoration: toolbarTheme.decoration,
    );
  }
}

class RbySliverToolbar extends StatelessWidget {
  const RbySliverToolbar({
    super.key,
    this.title,
    this.leading,
    this.trailing = const [],
    this.trailingSeparator = const Gap.m(),
    this.pinned = false,
    this.floating = true,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget> trailing;
  final Widget trailingSeparator;

  final bool pinned;
  final bool floating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final toolbarTheme = theme.toolbarTheme;

    return SliverPersistentHeader(
      pinned: pinned,
      floating: floating,
      delegate: _SliverHeaderDelegate(
        pinned: pinned,
        floating: floating,
        title: title,
        leading: leading,
        trailing: trailing,
        trailingSeparator: trailingSeparator,
        minExtent: toolbarTheme.height + mediaQuery.padding.top,
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SliverHeaderDelegate({
    required this.pinned,
    required this.floating,
    required this.title,
    required this.leading,
    required this.trailing,
    required this.trailingSeparator,
    required this.minExtent,
  });

  final bool pinned;
  final bool floating;
  final Widget? title;
  final Widget? leading;
  final List<Widget> trailing;
  final Widget trailingSeparator;

  @override
  final double minExtent;

  @override
  double get maxExtent => minExtent;

  @override
  bool shouldRebuild(covariant _SliverHeaderDelegate oldDelegate) {
    return title != oldDelegate.title ||
        leading != oldDelegate.leading ||
        !listEquals(trailing, oldDelegate.trailing) ||
        trailingSeparator != oldDelegate.trailingSeparator;
  }

  bool _isOverscrolled(double shrinkOffset, bool overlapsContent) {
    if (pinned && floating) return overlapsContent || shrinkOffset > 0;
    if (floating) return overlapsContent;
    if (pinned) return shrinkOffset > 0;
    return false;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    final toolbarTheme = theme.toolbarTheme;

    return Stack(
      children: [
        if (toolbarTheme.sliverBackdropFilter != null)
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: toolbarTheme.sliverBackdropFilter!,
                child: const SizedBox(),
              ),
            ),
          ),
        _InternalRbyToolbar(
          title: title,
          leading: leading,
          trailing: trailing,
          trailingSeparator: trailingSeparator,
          height: toolbarTheme.height,
          padding: toolbarTheme.padding,
          middleSpacing: toolbarTheme.middleSpacing,
          buttonStyle: toolbarTheme.buttonStyle,
          automaticallyImplyLeading: toolbarTheme.automaticallyImplyLeading,
          decoration: _isOverscrolled(shrinkOffset, overlapsContent)
              ? toolbarTheme.sliverOverscrollDecoration ??
                  toolbarTheme.sliverDecoration
              : toolbarTheme.sliverDecoration,
        ),
      ],
    );
  }
}

class _InternalRbyToolbar extends StatelessWidget {
  const _InternalRbyToolbar({
    required this.title,
    required this.leading,
    required this.trailing,
    required this.trailingSeparator,
    required this.height,
    required this.padding,
    required this.middleSpacing,
    required this.buttonStyle,
    required this.automaticallyImplyLeading,
    required this.decoration,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget> trailing;
  final Widget trailingSeparator;

  // values from theme
  final double height;
  final EdgeInsets padding;
  final double middleSpacing;
  final ButtonStyle? buttonStyle;
  final bool automaticallyImplyLeading;
  final BoxDecoration? decoration;

  Widget? _leading(BuildContext context) {
    final child = leading ?? _implyLeading(context);
    if (child == null) return null;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [child],
    );
  }

  Widget? _trailing() {
    if (trailing.isEmpty) return null;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < trailing.length; ++i) ...[
          trailing[i],
          if (i < trailing.length - 1) trailingSeparator,
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    // manually animate the decoration change to properly animate the overscroll
    // decoration for the sliver toolbar
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: decoration,
      child: Container(
        height: height,
        margin: EdgeInsets.only(top: mediaQuery.padding.top),
        padding: padding,
        child: Theme(
          data: theme.copyWith(
            textButtonTheme: TextButtonThemeData(
              style: buttonStyle?.merge(theme.textButtonTheme.style),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: buttonStyle?.merge(theme.elevatedButtonTheme.style),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: buttonStyle?.merge(theme.outlinedButtonTheme.style),
            ),
          ),
          child: NavigationToolbar(
            leading: _leading(context),
            middle: title != null
                ? DefaultTextStyle(
                    style: theme.textTheme.titleMedium!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    child: title!,
                  )
                : null,
            trailing: _trailing(),
            middleSpacing: middleSpacing,
          ),
        ),
      ),
    );
  }
}

Widget? _implyLeading(BuildContext context) {
  final theme = Theme.of(context);
  final route = ModalRoute.of(context);
  final toolbarTheme = theme.toolbarTheme;

  if (route is PageRoute<dynamic> &&
      route.fullscreenDialog &&
      toolbarTheme.closeIcon != null) {
    return TextButton(
      onPressed: Navigator.of(context).maybePop,
      child: Icon(toolbarTheme.closeIcon),
    );
  }

  if (Navigator.of(context).canPop() && toolbarTheme.backIcon != null) {
    return TextButton(
      onPressed: Navigator.of(context).maybePop,
      child: Icon(toolbarTheme.backIcon),
    );
  }

  if (Scaffold.of(context).hasDrawer && toolbarTheme.openDrawerIcon != null) {
    return TextButton(
      onPressed: Scaffold.of(context).openDrawer,
      child: Icon(toolbarTheme.openDrawerIcon),
    );
  }

  return null;
}
