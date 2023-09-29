import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class RbyToolbar extends StatelessWidget {
  const RbyToolbar({
    super.key,
    this.title,
    this.leading = const [],
    this.trailing = const [],
    this.leadingSeparator = const Gap.m(),
    this.trailingSeparator = const Gap.m(),
    this.padding,
    this.middleSpacing,
  });

  final Widget? title;
  final List<Widget> leading;
  final List<Widget> trailing;
  final Widget leadingSeparator;
  final Widget trailingSeparator;
  final EdgeInsets? padding;
  final double? middleSpacing;

  Widget? _leading(BuildContext context, RbyToolbarTheme toolbarTheme) {
    final children = [
      if (toolbarTheme.implyLeading) ..._impliedLeading(context),
      ...leading,
    ];

    if (children.isEmpty) {
      return null;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < children.length; ++i) ...[
          if (i < children.length - 1) leadingSeparator,
          children[i],
        ],
      ],
    );
  }

  Widget? _trailing(BuildContext context, RbyToolbarTheme toolbarTheme) {
    final children = [
      if (toolbarTheme.implyTrailing) ..._impliedTrailing(context),
      ...trailing,
    ];

    if (children.isEmpty) {
      return null;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < children.length; ++i) ...[
          children[i],
          if (i < children.length - 1) trailingSeparator,
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final toolbarTheme = theme.rbyToolbarTheme;

    final padding =
        this.padding ?? EdgeInsets.symmetric(horizontal: theme.spacingScheme.m);

    return Padding(
      padding: EdgeInsets.only(top: mediaQuery.padding.top) + padding,
      child: SizedBox(
        height: toolbarTheme.height,
        child: NavigationToolbar(
          leading: _leading(context, toolbarTheme),
          middle: title != null
              ? DefaultTextStyle(
                  style: theme.textTheme.titleMedium!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  child: title!,
                )
              : null,
          trailing: _trailing(context, toolbarTheme),
          middleSpacing: middleSpacing ?? theme.spacingScheme.m,
        ),
      ),
    );
  }
}

class RbySliverToolbar extends StatelessWidget {
  const RbySliverToolbar({
    super.key,
    this.title,
    this.leading = const [],
    this.trailing = const [],
    this.leadingSeparator = const Gap.m(),
    this.trailingSeparator = const Gap.m(),
    this.padding,
    this.middleSpacing,
    this.pinned = false,
    this.floating = true,
  });

  final Widget? title;
  final List<Widget> leading;
  final List<Widget> trailing;
  final Widget leadingSeparator;
  final Widget trailingSeparator;
  final EdgeInsets? padding;
  final double? middleSpacing;

  final bool pinned;
  final bool floating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final toolbarTheme = theme.rbyToolbarTheme;

    final padding =
        this.padding ?? EdgeInsets.symmetric(horizontal: theme.spacingScheme.m);

    return SliverPersistentHeader(
      pinned: pinned,
      floating: floating,
      delegate: _SliverHeaderDelegate(
        title: title,
        leading: leading,
        trailing: trailing,
        leadingSeparator: leadingSeparator,
        trailingSeparator: trailingSeparator,
        padding: padding,
        middleSpacing: middleSpacing,
        height: toolbarTheme.height + mediaQuery.padding.top,
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SliverHeaderDelegate({
    required this.title,
    required this.leading,
    required this.trailing,
    required this.leadingSeparator,
    required this.trailingSeparator,
    required this.middleSpacing,
    required this.padding,
    required this.height,
  });

  final Widget? title;
  final List<Widget> leading;
  final List<Widget> trailing;
  final Widget leadingSeparator;
  final Widget trailingSeparator;
  final double? middleSpacing;
  final EdgeInsets padding;
  final double height;

  @override
  double get minExtent => height + padding.vertical;

  @override
  double get maxExtent => minExtent;

  @override
  bool shouldRebuild(covariant _SliverHeaderDelegate oldDelegate) {
    return title != oldDelegate.title ||
        !listEquals(leading, oldDelegate.leading) ||
        !listEquals(trailing, oldDelegate.trailing) ||
        leadingSeparator != oldDelegate.leadingSeparator ||
        trailingSeparator != oldDelegate.trailingSeparator ||
        middleSpacing != oldDelegate.middleSpacing ||
        padding != oldDelegate.padding ||
        height != oldDelegate.height;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    final toolbarTheme = theme.rbyToolbarTheme;

    return Stack(
      children: [
        if (toolbarTheme.sliverBackdropFilter != null &&
            (overlapsContent || shrinkOffset > 0))
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: toolbarTheme.sliverBackdropFilter!,
                child: const SizedBox(),
              ),
            ),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: theme.colorScheme.background.withOpacity(.9),
            border: Border(
              bottom: BorderSide(
                color: overlapsContent || shrinkOffset > 0
                    ? theme.colorScheme.outlineVariant
                    : theme.colorScheme.outlineVariant.withOpacity(0),
              ),
            ),
          ),
          child: RbyToolbar(
            title: title,
            leading: leading,
            trailing: trailing,
            leadingSeparator: leadingSeparator,
            trailingSeparator: trailingSeparator,
            padding: padding,
            middleSpacing: middleSpacing,
          ),
        ),
      ],
    );
  }
}

List<Widget> _impliedLeading(BuildContext context) {
  final theme = Theme.of(context);
  final route = ModalRoute.of(context);
  final toolbarTheme = theme.rbyToolbarTheme;

  final children = <Widget>[];

  if (route is PageRoute<dynamic> && route.fullscreenDialog) {
    if (toolbarTheme.closeIcon != null) {
      children.add(
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(theme.spacingScheme.m),
            foregroundColor: theme.colorScheme.onBackground,
          ),
          onPressed: Navigator.of(context).maybePop,
          child: const Icon(Icons.close_rounded),
        ),
      );
    }
  } else if (Navigator.of(context).canPop() && toolbarTheme.backIcon != null) {
    children.add(
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(theme.spacingScheme.m),
          foregroundColor: theme.colorScheme.onBackground,
        ),
        onPressed: Navigator.of(context).maybePop,
        child: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }

  if (Scaffold.of(context).hasDrawer && toolbarTheme.openDrawerIcon != null) {
    children.add(
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(theme.spacingScheme.m),
          foregroundColor: theme.colorScheme.onBackground,
        ),
        onPressed: Scaffold.of(context).openDrawer,
        child: const Icon(Icons.menu_rounded),
      ),
    );
  }

  return children;
}

List<Widget> _impliedTrailing(BuildContext context) {
  final theme = Theme.of(context);
  final toolbarTheme = theme.rbyToolbarTheme;

  final children = <Widget>[];

  if (Scaffold.of(context).hasEndDrawer &&
      toolbarTheme.openEndDrawerIcon != null) {
    children.add(
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(theme.spacingScheme.m),
          foregroundColor: theme.colorScheme.onBackground,
        ),
        onPressed: Scaffold.of(context).openEndDrawer,
        child: const Icon(Icons.menu_rounded),
      ),
    );
  }

  return children;
}
