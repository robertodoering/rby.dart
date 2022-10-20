import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class RbyAppBar extends StatelessWidget {
  const RbyAppBar({
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    final style = theme.textTheme.titleLarge!.copyWith(height: 1);

    return Container(
      width: double.infinity,
      decoration: backgroundDecoration,
      constraints: BoxConstraints.tightFor(
        height:
            mediaQuery.padding.top + theme.spacing.base * 2 + style.fontSize!,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: mediaQuery.padding.top),
          child: NavigationToolbar(
            leading: _leading(context, leading: leading),
            middle: title != null
                ? DefaultTextStyle(
                    style: style,
                    child: fittedTitle ? FittedBox(child: title) : title!,
                  )
                : null,
            trailing: _trailing(context, actions: actions),
            middleSpacing: theme.spacing.base / 2,
          ),
        ),
      ),
    );
  }
}

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

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      width: double.infinity,
      decoration: backgroundDecoration,
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: topPadding),
          child: NavigationToolbar(
            leading: _leading(context, leading: leading),
            middle: title != null
                ? DefaultTextStyle(
                    style: titleStyle,
                    child: fittedTitle ? FittedBox(child: title) : title!,
                  )
                : null,
            trailing: _trailing(context, actions: actions),
            middleSpacing: paddingValue / 2,
          ),
        ),
      ),
    );
  }
}

Widget? _leading(
  BuildContext context, {
  required Widget? leading,
}) {
  final theme = Theme.of(context);
  final route = ModalRoute.of(context);

  Widget? child;

  if (leading != null) {
    child = leading;
  } else if (Scaffold.of(context).hasDrawer) {
    child = RbyButton.transparent(
      icon: theme.iconData.drawer(context),
      onTap: Scaffold.of(context).openDrawer,
    );
  } else if (route is PageRoute<dynamic> && route.fullscreenDialog) {
    child = RbyButton.transparent(
      icon: theme.iconData.close(context),
      onTap: Navigator.of(context).maybePop,
    );
  } else if (Navigator.of(context).canPop()) {
    child = RbyButton.transparent(
      icon: theme.iconData.back(context),
      onTap: Navigator.of(context).maybePop,
    );
  }

  if (child != null) return child;
  return null;
}

Widget? _trailing(
  BuildContext context, {
  required List<Widget>? actions,
}) {
  final theme = Theme.of(context);

  Widget? child;

  if (actions != null) {
    child = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: actions,
    );
  } else if (Scaffold.of(context).hasEndDrawer) {
    child = RbyButton.transparent(
      icon: theme.iconData.drawer(context),
      onTap: Scaffold.of(context).openEndDrawer,
    );
  }

  if (child != null) return child;
  return null;
}
