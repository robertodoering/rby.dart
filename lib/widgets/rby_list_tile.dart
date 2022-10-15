import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class RbyListTile extends StatelessWidget {
  const RbyListTile({
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.borderRadius,
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

  final BorderRadius? borderRadius;
  final Color? color;
  final VoidCallback? onTap;
  final bool enabled;

  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? leadingPadding;
  final EdgeInsetsGeometry? trailingPadding;
  final CrossAxisAlignment verticalAlignment;
  final bool multilineTitle;
  final bool multilineSubtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textStyle = theme.textTheme.titleSmall ?? const TextStyle();
    final onBackground = theme.colorScheme.onBackground;

    return Material(
      color: color,
      type: MaterialType.transparency,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: borderRadius,
        child: IconTheme(
          data: theme.iconTheme.copyWith(
            color: enabled ? onBackground : onBackground.withOpacity(.5),
          ),
          child: Row(
            crossAxisAlignment: verticalAlignment,
            children: [
              if (leading != null)
                Padding(
                  padding: leadingPadding ?? theme.spacing.edgeInsets,
                  child: leading,
                ),
              if (title != null || subtitle != null)
                Expanded(
                  child: Padding(
                    padding: contentPadding ?? theme.spacing.edgeInsets,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null)
                          DefaultTextStyle(
                            maxLines: multilineTitle ? 3 : 1,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle.copyWith(
                              height: multilineTitle ? null : 1,
                              color: onBackground.withOpacity(
                                enabled ? onBackground.opacity : .5,
                              ),
                            ),
                            child: title!,
                          ),
                        if (title != null && subtitle != null)
                          VerticalSpacer.small,
                        if (subtitle != null)
                          DefaultTextStyle(
                            maxLines: multilineSubtitle ? null : 1,
                            overflow: multilineSubtitle
                                ? TextOverflow.clip
                                : TextOverflow.ellipsis,
                            style: textStyle
                                .copyWith(
                                  height: multilineSubtitle ? null : 1,
                                  color: onBackground.withOpacity(
                                    enabled ? .8 : .4,
                                  ),
                                )
                                .apply(fontSizeDelta: -2),
                            child: subtitle!,
                          ),
                      ],
                    ),
                  ),
                )
              else
                const Spacer(),
              if (trailing != null)
                Padding(
                  padding: trailingPadding ?? theme.spacing.edgeInsets,
                  child: trailing,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
