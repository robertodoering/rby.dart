import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class RbyListCard extends StatelessWidget {
  const RbyListCard({
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.border,
    this.color,
    this.onTap,
    this.enabled = true,
    this.contentPadding,
    this.leadingPadding,
    this.trailingPadding,
    this.verticalAlignment = CrossAxisAlignment.center,
    this.multilineTitle = false,
    this.multilineSubtitle = true,
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;

  final Border? border;
  final Color? color;
  final VoidCallback? onTap;
  final bool enabled;

  final EdgeInsets? contentPadding;
  final EdgeInsets? leadingPadding;
  final EdgeInsets? trailingPadding;
  final CrossAxisAlignment verticalAlignment;
  final bool multilineTitle;
  final bool multilineSubtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = this.color ?? theme.cardTheme.color;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: theme.shapeScheme.borderRadius,
        border: border,
        color: enabled ? color : color?.withOpacity(.5),
      ),
      child: RbyListTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        borderRadius: theme.shapeScheme.borderRadius,
        color: color,
        onTap: onTap,
        enabled: enabled,
        contentPadding: contentPadding,
        leadingPadding: leadingPadding,
        trailingPadding: trailingPadding,
        verticalAlignment: verticalAlignment,
        multilineTitle: multilineTitle,
        multilineSubtitle: multilineSubtitle,
      ),
    );
  }
}
