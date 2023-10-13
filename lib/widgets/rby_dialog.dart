import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class RbyDialog extends StatelessWidget {
  const RbyDialog({
    super.key,
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
          padding: titlePadding ??
              EdgeInsets.only(
                top: theme.spacingScheme.xl,
                left: theme.spacingScheme.xl,
                right: theme.spacingScheme.xl,
              ),
          child: DefaultTextStyle(
            style: theme.textTheme.titleLarge!,
            textAlign: TextAlign.center,
            child: title!,
          ),
        ),
      );
    }

    return Dialog(
      clipBehavior: clipBehavior,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: AlignmentDirectional.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (titleWidget != null) titleWidget,
              if (stickyContent != null) stickyContent!,
              Flexible(
                child: Padding(
                  padding:
                      contentPadding ?? EdgeInsets.all(theme.spacingScheme.l),
                  child: DefaultTextStyle(
                    style: theme.textTheme.titleSmall!,
                    child: SingleChildScrollView(child: content),
                  ),
                ),
              ),
              if (actions != null)
                _ActionBar(
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

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.actions,
    this.padding,
  });

  final List<Widget> actions;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ??
          EdgeInsets.only(
            left: theme.spacingScheme.l,
            right: theme.spacingScheme.l,
            bottom: theme.spacingScheme.l,
          ),
      child: OverflowBar(
        alignment: MainAxisAlignment.spaceAround,
        spacing: theme.spacingScheme.l,
        overflowSpacing: theme.spacingScheme.m,
        overflowAlignment: OverflowBarAlignment.center,
        children: actions,
      ),
    );
  }
}
