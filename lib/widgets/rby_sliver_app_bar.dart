import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

/// A custom alternative [SliverAppBar].
class RbySliverAppBar extends StatelessWidget {
  const RbySliverAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.fittedTitle = true,
    this.backgroundDecoration,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool fittedTitle;
  final BoxDecoration? backgroundDecoration;

  static double height(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final style = theme.textTheme.titleLarge!.copyWith(height: 1);

    return mediaQuery.padding.top + theme.spacing.base * 2 + style.fontSize!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    final style = theme.textTheme.titleLarge!.copyWith(height: 1);

    return SliverPersistentHeader(
      floating: true,
      delegate: _SliverHeaderDelegate(
        title: title,
        leading: leading,
        actions: actions,
        backgroundDecoration: backgroundDecoration ??
            BoxDecoration(color: theme.colorScheme.background.withOpacity(.8)),
        topPadding: mediaQuery.padding.top,
        paddingValue: theme.spacing.base,
        titleStyle: style,
        fittedTitle: fittedTitle,
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SliverHeaderDelegate({
    required this.title,
    required this.leading,
    required this.actions,
    required this.backgroundDecoration,
    required this.topPadding,
    required this.paddingValue,
    required this.titleStyle,
    required this.fittedTitle,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final BoxDecoration backgroundDecoration;
  final double topPadding;
  final double paddingValue;
  final TextStyle titleStyle;
  final bool fittedTitle;

  @override
  double get minExtent => topPadding + paddingValue * 2 + titleStyle.fontSize!;

  @override
  double get maxExtent => minExtent;

  @override
  bool shouldRebuild(covariant _SliverHeaderDelegate oldDelegate) {
    return oldDelegate.title != title ||
        oldDelegate.leading != leading ||
        !listEquals(oldDelegate.actions, actions) ||
        oldDelegate.backgroundDecoration != backgroundDecoration ||
        oldDelegate.topPadding != topPadding ||
        oldDelegate.paddingValue != paddingValue ||
        oldDelegate.titleStyle != titleStyle ||
        oldDelegate.fittedTitle != oldDelegate.fittedTitle;
  }

  Widget? _leading(BuildContext context) {
    final route = ModalRoute.of(context);

    Widget? child;

    // TODO: add icon scheme?

    if (leading != null) {
      child = leading;
    } else if (Scaffold.of(context).hasDrawer) {
      child = RbyButton.transparent(
        icon: const RotatedBox(
          quarterTurns: 1,
          // child: Icon(FeatherIcons.barChart2),
        ),
        onTap: Scaffold.of(context).openDrawer,
      );
    } else if (route is PageRoute<dynamic> && route.fullscreenDialog) {
      child = RbyButton.transparent(
        // icon: const Icon(CupertinoIcons.xmark),
        onTap: Navigator.of(context).maybePop,
      );
    } else if (Navigator.of(context).canPop()) {
      child = RbyButton.transparent(
        icon: Transform.translate(
          offset: const Offset(-1, 0),
          // child: const Icon(CupertinoIcons.left_chevron),
        ),
        onTap: Navigator.of(context).maybePop,
      );
    }

    if (child != null) {
      return Padding(
        padding: EdgeInsetsDirectional.only(start: paddingValue / 2),
        child: child,
      );
    }

    return null;
  }

  Widget? _trailing(BuildContext context) {
    Widget? child;

    if (actions != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: actions!,
      );
    } else if (Scaffold.of(context).hasEndDrawer) {
      child = RbyButton.transparent(
        // icon: const RotatedBox(
        //   quarterTurns: -1,
        //   child: Icon(FeatherIcons.barChart2),
        // ),
        onTap: Scaffold.of(context).openEndDrawer,
      );
    }

    if (child != null) {
      return Padding(
        padding: EdgeInsetsDirectional.only(end: paddingValue / 2),
        child: child,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: theme.animation.short,
      width: double.infinity,
      decoration: backgroundDecoration,
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: topPadding),
          child: NavigationToolbar(
            leading: _leading(context),
            middle: title != null
                ? DefaultTextStyle(
                    style: titleStyle,
                    child: fittedTitle ? FittedBox(child: title) : title!,
                  )
                : null,
            trailing: _trailing(context),
            middleSpacing: paddingValue / 2,
          ),
        ),
      ),
    );
  }
}
