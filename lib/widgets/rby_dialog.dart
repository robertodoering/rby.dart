import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

class RbyDialog extends StatelessWidget {
  const RbyDialog({
    this.title,
    this.stickyContent,
    this.content,
    this.actions,
    this.clipBehavior = Clip.none,
    this.titlePadding,
    this.contentPadding,
    this.actionsPadding,
  });

  final Widget? title;
  final Widget? stickyContent;
  final Widget? content;
  final List<Widget>? actions;

  final Clip clipBehavior;

  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? actionsPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget? titleWidget;

    if (title != null) {
      titleWidget = Center(
        child: Padding(
          padding: titlePadding ?? (theme.edgeInsets * 2).copyWith(bottom: 0),
          child: DefaultTextStyle(
            style: theme.textTheme.titleLarge!,
            textAlign: TextAlign.center,
            child: title!,
          ),
        ),
      );
    }

    return Unfocus(
      child: Dialog(
        clipBehavior: clipBehavior,
        // TODO: use RbyAnimatedSize
        child: AnimatedSize(
          duration: theme.shortAnimationDuration,
          curve: Curves.easeInOut,
          alignment: AlignmentDirectional.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (titleWidget != null) titleWidget,
              if (stickyContent != null) stickyContent!,
              Flexible(
                child: Padding(
                  padding: contentPadding ?? theme.edgeInsets,
                  child: DefaultTextStyle(
                    style: theme.textTheme.titleSmall!,
                    child: Scrollbar(
                      child: SingleChildScrollView(child: content),
                    ),
                  ),
                ),
              ),
              if (actions != null)
                HarpyDialogActionBar(
                  actions: actions!,
                  padding: actionsPadding,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Displays a list of [actions] (usually buttons) in an [OverflowBar].
class HarpyDialogActionBar extends StatelessWidget {
  const HarpyDialogActionBar({
    required this.actions,
    this.padding,
  });

  final List<Widget> actions;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ?? theme.edgeInsets.copyWith(top: 0),
      child: OverflowBar(
        alignment: MainAxisAlignment.spaceAround,
        spacing: theme.paddingValue,
        overflowSpacing: theme.smallPaddingValue,
        overflowAlignment: OverflowBarAlignment.center,
        children: actions,
      ),
    );
  }
}
