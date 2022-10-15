import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

/// A card which can collapse to hide its children.
///
/// Similar to the material [ExpansionPanel].
class ExpansionCard extends StatefulWidget {
  const ExpansionCard({
    required this.title,
    required this.children,
    this.initiallyCollapsed = false,
  });

  final Widget title;
  final List<Widget> children;
  final bool initiallyCollapsed;

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  late bool _collapsed = widget.initiallyCollapsed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => setState(() => _collapsed = !_collapsed),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: theme.spacingScheme.edgeInsets,
                    child: DefaultTextStyle(
                      style: theme.textTheme.subtitle2!,
                      child: widget.title,
                    ),
                  ),
                ),
                RbyButton.transparent(
                  padding: EdgeInsets.symmetric(
                    vertical: theme.spacingScheme.base,
                    horizontal: theme.spacingScheme.base * 1.5,
                  ),
                  icon: AnimatedRotation(
                    duration: theme.animationScheme.short,
                    curve: Curves.easeOut,
                    turns: _collapsed ? .5 : 0,
                    // TODO: add icon scheme?
                    child: const Icon(CupertinoIcons.chevron_down),
                  ),
                  onTap: () => setState(() => _collapsed = !_collapsed),
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
            duration: theme.animationScheme.short,
            firstCurve: Curves.easeOut,
            secondCurve: Curves.easeOut,
            sizeCurve: Curves.easeOutCubic,
            crossFadeState: _collapsed
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: AnimatedScale(
              duration: theme.animationScheme.short,
              scale: _collapsed ? .95 : 1,
              curve: Curves.easeInOut,
              child: Column(children: widget.children),
            ),
            secondChild: const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}
